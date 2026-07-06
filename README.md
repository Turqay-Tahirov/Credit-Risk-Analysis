# Credit Risk Analytics Dashboard

## 📌 Layihə Haqqında (About the Project)
**AZ:** Bu layihə, bank mühitində kredit risklərinin effektiv idarə edilməsi və optimallaşdırılması üçün hazırlanıb. Müştərilərin demoqrafik göstəriciləri (yaş, iş təcrübəsi), ümumi gəlirləri (əsas maaş və komissiya bonusları) və kredit xüsusiyyətləri analiz edilir. Məqsəd — hansı müştərilərin ödənişi gecikdirə biləcəyini (Default riski) əvvəlcədən təyin etmək və bu riskləri modern, tünd rejimli (Dark Mode) interaktiv dashboard-lar vasitəsilə qərarvericilərə təqdim etməkdir.

**EN:** This project is designed to enhance credit risk management in banking. It analyzes customer demographics (age, work experience), total income (base salary and commission bonuses), and loan characteristics. The goal is to identify high-risk borrowers (Default Risk) and visualize these insights through modern, Dark Mode interactive dashboards for efficient credit decision-making.

---

## 🛠 Texnologiyalar (Tech Stack)
* **Python** (Data Processing & Cleaning)
* **SQL** (Data Querying & Segmentation)
* **Power BI** (Data Modeling & UI/UX Dashboarding)

---

## 🚀 Layihə Mərhələləri (Project Stages)

*   [x] 🏗️ Repozitoriyanın qurulması (Repository Setup)
*   [x] 📝 README sənədləşməsinin hazırlanması (Documentation)
*   [x] 🛠️ Python ilə məlumatların ilkin emalı (Python Data Cleaning)
*   [ ] 📊 Python ilə  analiz (Python EDA & Risk Analytics)
*   [x] 🗄️ SQL sorğuları ilə analitika (SQL Analytics)
*   [ ] 📐 Power BI-da Data Modeling və DAX (Modeling & DAX)
*   [ ] 🎨 UI/UX Premium Dizayn (Dashboard Finalization)

## 📊 Dataset Haqqında (About the Dataset)

**AZ:** Bu layihədə istifadə olunan dataset bank müştərilərinin kredit tarixçələrini və demoqrafik məlumatlarını əks etdirir. Dataset ümumilikdə 32,409 müştərinin məlumatından və risk analizində kritik rol oynayan fərqli göstəricilərdən (sütunlardan) ibarətdir.

**EN:** The dataset used in this project represents bank customers' credit histories and demographic data. It includes information for 32,409 customers and features critical indicators used in credit risk analysis.

### 📋 Göstəricilərin Təsviri (Data Dictionary)

| Column Name | Təsvir (Description) |
| :--- | :--- |
| `person_age` | Müştərinin yaşı |
| `person_income` | Müştərinin illik ümumi gəliri |
| `person_home_ownership` | Yaşayış şəraiti (Kirayə, İpoteka, Şəxsi, Digər) |
| `person_emp_length` | Müştərinin iş təcrübəsi (il ilə) |
| `loan_intent` | Kreditin götürülmə səbəbi (Təhsil, Tibb, Şəxsi və s.) |
| `loan_grade` | Bank daxili risk reytinqi (A-G) |
| `loan_amnt` | Götürülən kreditin ümumi məbləği |
| `loan_int_rate` | Kreditə tətbiq olunan faiz dərəcəsi |
| `loan_status` | Defolt vəziyyəti (0 = Ödəyir, 1 = Defolt/Gecikdirir) |
| `loan_percent_income` | Götürülən kreditin illik gəlirə olan nisbəti (faizlə) |
| `cb_person_default_on_file` | Əvvəllər rəsmi ödəniş gecikdirilməsinin olması (Y/N) |
| `cb_person_cred_hist_length` | Müştərinin kredit tarixçəsinin uzunluğu (il ilə) |

---
