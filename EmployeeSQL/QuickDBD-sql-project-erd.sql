﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/1CChg4
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [departments] (
    [dept_no] varchar(255)  NOT NULL ,
    [dept_name] varchar(255)  NOT NULL ,
    CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [dept_emp] (
    [emp_no] int  NOT NULL ,
    [dept_no] varchar(255)  NOT NULL 
)

CREATE TABLE [dept_manager] (
    [emp_no] int  NOT NULL ,
    [dept_no] varchar(255)  NOT NULL 
)

CREATE TABLE [employees] (
    [emp_no] int  NOT NULL ,
    [emp_title_id] varchar(255)  NOT NULL ,
    [birth_date] varchar(255)  NOT NULL ,
    [first_name] varchar(255)  NOT NULL ,
    [last_name] varchar(255)  NOT NULL ,
    [sex] varchar(255)  NOT NULL ,
    [hire_date] varchar(255)  NOT NULL ,
    CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [salaries] (
    [emp_no] int  NOT NULL ,
    [salary] int  NOT NULL 
)

CREATE TABLE [titles] (
    [title_id] varchar(255)  NOT NULL ,
    [title] varchar(255)  NOT NULL ,
    CONSTRAINT [PK_titles] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    )
)

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp__emp_no] FOREIGN KEY([], [emp_no])
REFERENCES [employees] ([], [emp_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp__emp_no]

ALTER TABLE [dept_emp] WITH CHECK ADD CONSTRAINT [FK_dept_emp_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_emp] CHECK CONSTRAINT [FK_dept_emp_dept_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_emp_no]

ALTER TABLE [dept_manager] WITH CHECK ADD CONSTRAINT [FK_dept_manager_dept_no] FOREIGN KEY([dept_no])
REFERENCES [departments] ([dept_no])

ALTER TABLE [dept_manager] CHECK CONSTRAINT [FK_dept_manager_dept_no]

ALTER TABLE [employees] WITH CHECK ADD CONSTRAINT [FK_employees__emp_title_id] FOREIGN KEY([], [emp_title_id])
REFERENCES [titles] ([], [title_id])

ALTER TABLE [employees] CHECK CONSTRAINT [FK_employees__emp_title_id]

ALTER TABLE [salaries] WITH CHECK ADD CONSTRAINT [FK_salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [employees] ([emp_no])

ALTER TABLE [salaries] CHECK CONSTRAINT [FK_salaries_emp_no]

COMMIT TRANSACTION QUICKDBD