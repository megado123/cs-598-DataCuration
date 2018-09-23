"# cs-598-DataCuration" 

Assignment 1: Relational Schema Design Exercise
Learning objectives
Become familiar with data abstraction, indirection, and strategies for data representation that use the relational model.
Gain experience analyzing the characteristics of a dataset.
Gain experience with documenting rationale for on data representation selection, emphasizing relevance to data curation.
Remember, this exercise is not about learning the relational model; we assume you already have a basic understanding. This is rather an opportunity to stand back and reflect on the general principles involved in exactly how the relational model solves data management problems.

And don’t make this too hard on yourself. We aren’t looking for detailed complex models. So it won’t be just one table, but otherwise feel free to make reasonable simplifying assumptions; you can note them in your documentation.

Scenario
The setting is an auto dealer. In this company, there are 3 departments, including:

Inventory
Sales
Customer relations
Right now, each department manages their information differently.

These departments would like to integrate their data into a shared database, in order to be able to answer questions like, “What engine is in Customer Smith’s car?.” It’s a challenge to answer right now because the Sales department has information about which car Customer Smith bought; the Inventory department tracks which engines are in which cars; and the Customer Relations has totally separate, slightly redundant information about Customer Smith.

You have been asked to design and populate a database that is effective and efficient for all departments and that will also support combining data from different departments.

You are given data from each department:

File A (Inventory): Document relating models to styles, power trains, quantities, and individual cars, etc.
File B (Sales): Document relating people to cars, prices, trade-ins, etc.
File C (Customer relations): Document relating people to personal information, information about services, warranties, etc.
Files A, B, and C can be downloaded below:

MDS_Exercise1_FileA.txt
MDS_Exercise1_FileB.csv
MDS_Exercise1_FileC.docx
Instructions
1. Write a short narrative description of each file we have given you. What information do they contain? How is the information formatted and organized? What kinds of information is shared among the files? (50-100 words per file)

2. Use your narrative to design a database schema that will accommodate the information in the files. Your schema should include:

Tables
Attributes (column heading) in each table
Datatypes for each attribute (develop your own)
Primary and foreign keys
3. Create an example of each table, populated with data from the files.

4. Write an account of your process for creating the database scheme and tables. Describe any decisions you had to make as you developed a relational schema.

How did you decide to represent the data in the way that you did?
Did you leave out any information? If so, why?
Why did you choose certain things as attributes? As keys?
What were the hardest decisions you had to make in this design process?
How does your schema design support data independence?
How may your schema design support the overarching goals of data curation (revisit objectives and activities of Week 1)?
Which curation activities could enhance or sustain the database for future discovery and use for new purposes? What additional activities would you recommend?
5. Submit your documents to Assignment 1 Peer Review for peer grading. Your assignment submission should include 2 parts:

A workbook including schema and tables from steps 2-3
A document containing your narratives from steps (1) and (4), above
We are flexible about how you want to do and submit this assignment. Here’s what we recommend you do for Steps 2-3 (but if you want to submit in a different format, it’s fine, as long as it’s readable):

In the first sheet of an Excel workbook, give us your schema (from step 2, above). You may use the simple syntax on slide “Schema for Relations” in Relations week slides to write out your description of tables. Indicate in prose a data type for each column (for example, string, integer, or a selection from a list of strings).
In subsequent sheets in this workbook, show us the example tables populated with data from the files (from step 3, above).
6. Each student will be required to grade the submissions of 5 of their peers. Submissions will be graded based on the following criteria. Write a constructive and professional review and post to the course forum replying to the individual’s submission.

Is everything represented?
Is it clearly written? Is the scheme and data clearly presented?
What are the pros and cons of this representation?
How could it be done differently? How could it be improved?
7. Revise and submit all documents as one single PDF file to Assignment 1 Submission for instructor grading.

There is no one right way to create a schema from these documents. There are a number of imaginable ways to achieve the same ends. You should justify the choices you make in your answers to the reflection questions.

Again, this is not about learning the relational model; we assume you already have a basic understanding. This is opportunity to stand back and reflect on the general principles involved in exactly how the relational model solves data management problems.

If you have questions about the assignment, use the course Forum. This is a great place to ask questions and also help your fellow classmates.
