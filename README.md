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

*   **1. 🏗️ Repository Setup & Documentation:** Professional qovluq strukturunun qurulması və layihənin biznes məntiqini izah edən README sənədinin hazırlanması.
*   **2. 🛠️ Python Data Cleaning:** Xam datadakı boş xanaların (missing values) median və rejim ilə doldurulması, tip xətalarının düzəldilməsi və anomal dəyərlərin (outliers) IQR metodu ilə təmizlənməsi.
*   **3. 📊 Python EDA & Risk Analytics:** `seaborn.heatmap` ilə korrelyasiya matrisinin çıxarılması, əsas risk drayverlərinin təyini və müştərilərin mənzil statusuna (`RENT`, `MORTGAGE`, `OWN`) görə kredit batma faizlərinin (defolt paylarının) vizual təhlili.
*   **4. 🗄️ SQL Analytics:** Məlumat bazası (PostgreSQL / T-SQL) səviyyəsində pəncərə funksiyaları (`WINDOW functions`) və CTE-lər vasitəsilə kredit reytinqləri üzrə defolt oranlarının hesablanması və aqreqasiya olunması.
*   **5. 📐 Power BI Data Modeling & DAX:** Ulduz sxemi (`Star Schema`) relyasiya modelinin qurulması; dinamik `Default Rate %` (Portfolio at Risk) və `Riskdə Olan Məbləğ` kimi kritik DAX metrikalarının yazılması.
*   **6. 🎨 UI/UX Dashboard Finalization:** Hesabatın **Xalq Bank** korporativ üslubuna (Qırmızı, Qara və Bəyaz) uyğunlaşdırılması, ağ ikonlu xüsusi KPI kartlarının yığılması, vizualların milimetrik hizalanması və başlıqların bank terminologiyasına tərcüməsi.    
## 🚀 Layihə Mərhələləri (Project Stages)



- [x] Repozitoriyanın qurulması (Repository Setup)
- [x] README sənədləşməsinin hazırlanması (Documentation)
- [ ] Python ilə məlumatların ilkin emalı (Python Data Cleaning)
- [x] SQL sorğuları ilə analitika (SQL Analytics)
- [ ] Power BI-da Data Modeling və DAX (Modeling & DAX)
- [ ] UI/UX Premium Dizayn (Dashboard Finalization)
