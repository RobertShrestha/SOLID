# SOLID
SOLID Principle in swift
File related to [SOLID Principles: Introducing Software Architecture & Design] (https://www.udemy.com/course/solid-design/) course of Udemy

-  ## The Single Responsibility Principle (SRP)
THERE SHOULD NEVER BE MORE THAN ONE REASON FOR A CLASS TO CHANGE.

### Solution
   - High cohesion
   - Loose coupling
- ### The Open-Closed Principle (OCP)
SOFTWARE ENTITIES (CLASSES, MODULES, FUNCTIONS, ETC.) SHOULD BE OPEN FOR EXTENSION, BUT CLOSED FOR MODIFICATION.
- ### The Liskov Substitution Principle (LSP)
FUNCTIONS THAT USE POINTERS OR REFERENCES TO BASE CLASSES MUST BE ABLE TO USE OBJECTS OF DERIVED CLASSES WITHOUT KNOWING IT.
Objects of a superclass should be replaceable with objects of its subclasses without affecting the correctness of the program

Solutions
  - Break the Hierarchy
  - "Tell, don't task"
- ### The Interface Segregation Principle (ISP)
CLIENTS SHOULD NOT BE FORCED TO DEPEND UPON INTERFACES THAT THEY DO NOT USE.

How to detech Violations of ISP principle
  - Fat interface
  - Interfaces with Low Cohesion
  - Empty method Implementation

- ### The Dependency Inversion Principle (DIP)
A. HIGH LEVEL MODULES SHOULD NOT DEPEND UPON LOW LEVEL MODULES. BOTH SHOULD DEPEND UPON ABSTRACTIONS.

B. ABSTRACTIONS SHOULD NOT DEPEND UPON DETAILS. DETAILS SHOULD DEPEND UPON ABSTRACTIONS.
