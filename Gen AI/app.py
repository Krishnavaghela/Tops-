import streamlit as st
from PyPDF2 import PdfReader
from langchain.text_splitter import RecursiveCharacterTextSplitter
import os 

from langchain_google_genai import GoogleGenerativeAIEmbeddings
import google.generativeai as genai
from langchain.chains.question_answering import load_qa_chain
from langchain.vectorstores import FAISS
from langchain.prompts import PromptTemplate
from langchain_google_genai import ChatGoogleGenerativeAI
from dotenv import load_dotenv

load_dotenv()
os.getenv('GOOGLE_API_KEY')
genai.configure(api_key=os.getenv("GOOGLE_API_KEY"))



def get_pdf_text(pdf):
    text=""
    for i in pdf:
        pdf_read = PdfReader(i)
        for page in pdf_read.pages:
            text+=page.extract_text()
    return text

def get_text_chunks(text):
    text_split = RecursiveCharacterTextSplitter(chunk_size=10000,chunk_overlap=1000)
    chunks= text_split.split_text(text)
    return chunks

def vector_stores(chunks):
    embeddings = GoogleGenerativeAIEmbeddings(model="models/embedding-001")
    vs = FAISS.from_texts(chunks,embedding=embeddings)
    vs.save_local("faiss_index")

def create_chain():

    prompt_template="""
       Answer the question in detailed manner explaining everything asked 
       in a proper and layman's language so that a fresher can easily understand,
       make sure to provide all the details, if the answer in not in provided context,
       just say "answer is not available in the context", don't provide the wrong answers\n\n
       Context:\n {context}?\n
       Question:\n{question}\n

       Answer:

    """

    model=ChatGoogleGenerativeAI(model='gemini-pro',temperature=0.7)

    prompt=PromptTemplate(template=prompt_template,input_variables=['Context','question'])
    chain=load_qa_chain(model,chain_type='stuff',prompt=prompt)
    return chain


def user_input(user_que):
    embeddings=GoogleGenerativeAIEmbeddings(model="models/embedding-001")

    new=FAISS.load_local("faiss_index",embeddings,allow_dangerous_deserialization=True)
    docs=new.similarity_search(user_que)

    chain=create_chain()

    response=chain(
        {
            "input_documents":docs, "question":user_que
        },return_only_outputs=True
    )
    print(response)
    st.write("REPLY: ", response["output_text"])


def main():
    st.set_page_config("CHAT PDF")
    st.header("CHATTING WITH PDFs")

    user_question = st.text_input("Ask a Question from the PDF ")

    if user_question:
        user_input(user_question)

    with st.sidebar:
        st.title("Menu")
        pdf_docs=st.file_uploader("Upload your PDF files and Click on Submit button", accept_multiple_files=True)
        if st.button("Submit and Process"):
            with st.spinner('Processing...'):
                raw_text=get_pdf_text(pdf_docs)
                chunk = get_text_chunks(raw_text)
                vector_stores(chunk)
                st.success("DONE")



if __name__=="__main__":
    main()

