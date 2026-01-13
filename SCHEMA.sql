-- =========================================
-- SCHEMA: HEALTHCARE MANAGEMENT SYSTEM
-- DATABASE: ORACLE
-- =========================================


-- =========================
-- PATIENTS TABLE
-- =========================
CREATE TABLE PATIENTS (
    PATIENT_ID        NUMBER PRIMARY KEY,
    FIRST_NAME        VARCHAR2(50),
    LAST_NAME         VARCHAR2(50),
    GENDER            VARCHAR2(10),
    DATE_OF_BIRTH     DATE,
    INSURANCE_PROVIDER VARCHAR2(100)
);


-- =========================
-- DOCTORS TABLE
-- =========================
CREATE TABLE DOCTORS (
    DOCTOR_ID        NUMBER PRIMARY KEY,
    FIRST_NAME       VARCHAR2(50),
    LAST_NAME        VARCHAR2(50),
    SPECIALIZATION   VARCHAR2(100),
    YEARS_EXPERIENCE NUMBER,
    HOSPITAL_BRANCH  VARCHAR2(100),
    PHONE_NUMBER     VARCHAR2(20)
);


-- =========================
-- APPOINTMENTS TABLE
-- =========================
CREATE TABLE APPOINTMENTS (
    APPOINTMENT_ID    NUMBER PRIMARY KEY,
    PATIENT_ID        NUMBER,
    DOCTOR_ID         NUMBER,
    APPOINTMENT_DATE  DATE,
    REASON_FOR_VISIT  VARCHAR2(200),
    STATUS            VARCHAR2(20),

    CONSTRAINT FK_APPOINTMENT_PATIENT
        FOREIGN KEY (PATIENT_ID)
        REFERENCES PATIENTS (PATIENT_ID),

    CONSTRAINT FK_APPOINTMENT_DOCTOR
        FOREIGN KEY (DOCTOR_ID)
        REFERENCES DOCTORS (DOCTOR_ID)
);


-- =========================
-- TREATMENTS TABLE
-- =========================
CREATE TABLE TREATMENTS (
    TREATMENT_ID     NUMBER PRIMARY KEY,
    APPOINTMENT_ID   NUMBER,
    TREATMENT_TYPE   VARCHAR2(100),
    DESCRIPTION      VARCHAR2(200),
    COST             NUMBER(10,2),
    TREATMENT_DATE   DATE,

    CONSTRAINT FK_TREATMENT_APPOINTMENT
        FOREIGN KEY (APPOINTMENT_ID)
        REFERENCES APPOINTMENTS (APPOINTMENT_ID)
);


-- =========================
-- BILLING TABLE
-- =========================
CREATE TABLE BILLING (
    BILL_ID         NUMBER PRIMARY KEY,
    BILL_DATE       DATE,
    AMOUNT          NUMBER(10,2),
    PAYMENT_STATUS  VARCHAR2(20),
    PAYMENT_METHOD  VARCHAR2(50)
);

