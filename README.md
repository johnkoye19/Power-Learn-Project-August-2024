# Power Learn Project August 2024
## Out of School Children Database
According to UNESCO, the world has about [250 million](https://www.unesco.org/en/articles/250-million-children-out-school-what-you-need-know-about-unescos-latest-education-data#:~:text=New%20UNESCO%20data%20shows%20that,progress%20continues%20to%20stagnate%20globally.) out-of-school children in 2022. Unsurprisingly, the world's out-of-school children are mostly children in poor and rural areas and are [mostly girls](https://uis.unesco.org/apps/visualisations/oosci-data-tool/index-en.html#en/cover). The World Bank estimates that about [700 million](https://www.worldbank.org/en/publication/poverty-prosperity-and-planet) people live in extreme poverty. This means that around 8% of the world's population lives on less than $2.15 (US dollars) a day.

We can't overstate the rights of children to education and the detrimental effects on our society if our children are unable to attend quality schools. Aside from social inequality and low earnings, there is a rise in the manipulation of out-of-school children to participate in criminal activities of different scales.

It becomes imperative to do something about it. This project aims to tackle the out-of-school children's situation by employing a holistic approach. This 'EDUTECH' solution employs a four-pronged approach, including scholarships, loans, teacher training, and school building. It considers a community of about 50,000 with 12,000 school-aged children and 2,400 out-of-school children. For children from low-income backgrounds, scholarships are available for the children and loans for their guardians to support businesses so that they can keep them in school. 

To monitor progress and keep track of key events and donations, the `out-of-school children` database was designed having the following tables: `children`, `class`, `donations`, `guardians`, `loans`, `scholarships`, `schools`, `teachers`. Here are the details:

### Core Tables

1. **Children**
   * child_id (PK, INT)
   * first_name (VARCHAR)
   * last_name (VARCHAR)
   * date_of_birth (DATE)
   * gender
   * address (VARCHAR)
   * enrollment_status (BOOLEAN)
   * guardian_id (FK, INT)
   * school_id (FK, INT)
   * class_id (FK, INT)
   * scholarship_id (FK, INT)

2. **Guardians**
   * guardian_id (PK, INT)
   * first_name (VARCHAR)
   * last_name (VARCHAR)
   * contact_info (VARCHAR)
   * occupation (VARCHAR)
   * income_level (VARCHAR)
   * reason_for_loan (TEXT)

3. **Schools**
   * school_id (PK, INT)
   * school_name (VARCHAR)
   * location (VARCHAR)
   * capacity (INT)
   * comissioning_date (DATE)
   * status (ENUM('Active', 'Inactive'))

4. **Teachers**
   * teacher_id (PK, INT)
   * first_name (VARCHAR)
   * last_name (VARCHAR)
   * subject (VARCHAR)
   * experience (INT)
   * training_status (BOOLEAN)

5. **Classes**
   * class_id (PK, INT)
   * class_name (VARCHAR)
   * comissioning_date (DATE)
   * school_id (FK, INT)

### Relationship Tables

6. **Scholarships**
   * scholarship_id (PK, INT)
   * child_id (FK, INT)
   * amount (DECIMAL(10,2))
   * award_date (DATE)

7. **Loans**
   * loan_id (PK, INT)
   * guardian_id (FK, INT)
   * amount (DECIMAL)
   * loan_date (DATE)
   * due_date (DATE)
   * status (ENUM('Pending', 'Approved', 'Disbursed', 'Repaid'))

8. **Donations**
   * donation_id (PK, INT)
   * donor_name (VARCHAR(100))
   * amount (DECIMAL(10,2))
   * donation_date (DATE)
   * purpose (ENUM('School Fees', 'Supplies', 'Living Expenses'))
