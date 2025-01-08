# Introduction to Database Systems Project

![bd1](https://github.com/user-attachments/assets/078e4c13-7b3f-4e04-9e54-a9ddf211be3e)


## **Introduction**

This project was developed as part of the Introduction to Database Systems course at UTEC, aimed at designing and implementing a robust database system for managing claims in healthcare centers. The project focuses on improving information handling and decision-making processes.

## **Project Objectives**

1. Improve the management and tracking of claims to facilitate case resolution and ensure appropriate attention to patients and requesters.
2. Optimize the organization and structure of information for efficient data access and consultation.
3. Enable the generation of reports and statistics to support decision-making and identify areas for improvement in healthcare services.
4. Design a scalable and adaptable database system that grows alongside the organization.

## **System Features**

- **Structured and Secure**: The database ensures secure and efficient data storage and retrieval.
- **Scalable**: Supports data growth without significant performance degradation.
- **Ease of Use**: Provides a user-friendly interface for queries, filtering, and report generation.
- **Compatibility**: Integrates seamlessly with existing systems to optimize healthcare center operations.

## **Database Design**

### **Key Components**
- **Entity-Relationship Model**: Designed to represent the relationships between various entities like patients, claims, and healthcare services.
- **Relational Model**: Converted from the entity-relationship model to ensure normalization and efficiency.
- **Constraints and Validations**: Defined to maintain data integrity and consistency.

### **Core Entities**
- **Person (Persona)**: Includes patients and claim requesters with attributes like name, contact, and demographics.
- **Claim (Reclamo)**: Tracks information such as type, reason, and resolution.
- **Service (Servicio)**: Represents healthcare services tied to claims.
- **Center and Location (Centro y Sede)**: Identify the healthcare facilities and their physical locations.

## **Implementation Details**

- **Database Platform**: PostgreSQL 14.8
- **Programming Language**: SQL and Python (for data simulation and automation)
- **Key Features**:
  - Data indexing for optimized queries.
  - Automated triggers for data consistency.
  - Support for large-scale data scenarios (up to 1 million records).

## **Performance Optimization**

Extensive experiments were conducted to evaluate query performance with and without indexing across datasets of varying sizes (1K, 10K, 100K, and 1M records). Results showed significant improvements in execution time with indexing.

## **System Requirements**

- **Hardware**: Minimum 8 GB RAM, SSD storage.
- **Software**: PostgreSQL, Python 3.x, pgAdmin.
- **Operating System**: Compatible with Linux, Windows, and macOS.
