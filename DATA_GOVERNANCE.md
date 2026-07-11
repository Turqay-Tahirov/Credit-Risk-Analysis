# 🛡️ Data Governance & Privacy Framework (mPay Scenario)

Bu sənəd layihədə istifadə olunan `credit_risk_dataset.csv` məlumat dəstinin (dataset) idarəetmə standartlarını, fərdi məlumatların qorunması (PII) siyasətini və Data Quality (Məlumat Keyfiyyəti) qaydalarını tənzimləyir. FinTex və bankçılıq requlyasiyalarına uyğun olaraq hazırlanmışdır.

---

## 📈 Dataset Haqqında Ümumi Məlumat
* **AZ:** Bu layihədə istifadə olunan dataset bank müştərilərinin kredit tarixcələrini və demoqrafik məlumatlarını əks etdirir. Dataset ümumilikdə **32,409** müştərinin məlumatından və risk analizində kritik rol oynayan fərqli göstəricilərdən (sütunlardan) ibarətdir.
* **EN:** The dataset used in this project represents bank customers' credit histories and demographic data. It includes information for **32,409** customers and features critical indicators used in credit risk analysis.

---

## 📋 Göstəricilərin Təsviri & Həssaslıq Təsnifati (Data Dictionary & Sensitivity)

Məlumatların məxfiliyi tələblərinə əsasən, sütunlar 3 kateqoriya üzrə təsnifləşdirilmişdir:
1. **PII (Personally Identifiable Information):** Müştərinin şəxsiyyətini birbaşa və ya dolayısı ilə müəyyən edən həssas demoqrafik datalar.
2. **Confidential (Məxfi):** Bankın daxili risk və maliyyə göstəriciləri (kənar şəxslərə qapalıdır).
3. **Internal (Daxili):** Analitiklər və daxili komandalar üçün açıq olan ümumi göstəricilər.

| Column Name | Təsvir (Description) | Data Type | Sensitivity Level | Access Control (Role) |
| :--- | :--- | :--- | :--- | :--- |
| **person_age** | Müştərinin yaşı | Integer | **PII (Həssas)** | Risk Analyst, Data Owner |
| **person_income** | Müştərinin illik ümumi gəliri | Decimal | **Confidential** | Financial / Risk Team |
| **person_home_ownership** | Yaşayış şəraiti (Kirayə, İpoteka, Şəxsi, Digər) | String | **Internal** | All Analytics Team |
| **person_emp_length** | Müştərinin iş təcrübəsi (il ilə) | Decimal | **Internal** | All Analytics Team |
| **loan_intent** | Kreditin götürülmə səbəbi (Təhsil, Tibb, Şəxsi və s.) | String | **Internal** | All Analytics Team |
| **loan_grade** | Bank daxili risk reytinqi (A-G) | String | **Confidential** | Risk Team, Credit Committee |
| **loan_amnt** | Götürülən kreditin ümumi məbləği | Decimal | **Confidential** | Financial / Risk Team |
| **loan_int_rate** | Kreditə tətbiq olunan faiz dərəcəsi | Decimal | **Confidential** | Financial / Risk Team |
| **loan_status** | Defolt vəziyyəti (0 = Ödəyir, 1 = Defolt/Gecikdirir) | Integer | **Confidential** | Risk Team, BI Developers |
| **loan_percent_income** | Götürülən kreditin illik gəlirə olan nisbəti (faizlə) | Decimal | **Internal** | All Analytics Team |
| **cb_person_default_on_file** | Əvvəllər rəsmi ödəniş gecikdirilməsinin olması (Y/N) | String | **Confidential** | Risk Team, Credit Committee |
| **cb_person_cred_length** | Müştərinin kredit tarixçəsinin uzunluğu (il ilə) | Integer | **Internal** | All Analytics Team |

---

## 🛠️ Məlumatların Təmizlənməsi & Keyfiyyət Siyasəti (Data Quality Control)

Xam məlumatlar (`credit_risk_dataset.csv`) proqram mühitinə yükləndikdən sonra, modelin dəqiqliyini qorumaq və risk analizini düzgün aparmaq üçün genişmiqyaslı data təmizlənməsi prosesi icra edilmişdir.

### 1. Boş Xanaların Doldurulması (Missing Values Imputation)
İnformasiya itkisinin qarşısının alınması məqsədilə boş olan xanalar (NaN) datadan silinməmiş, hər sütunun öz **median** göstəricisi ilə tamamlanmışdır:
* `person_emp_length` sütununda olan boşluqlar iş təcrübəsinin median dəyəri ilə əvəzlənmişdir.
* `loan_int_rate` sütunundakı boş faizlər mövcud kredit faizlərinin median göstəricisinə əsasən doldurulmuşdur.

### 2. Data Anomaliyalarının İdarə Edilməsi (Outlier Management)
Data Governance standartlarına əsasən, bioloji və ya məntiqi cəhətdən qeyri-mümkün olan dəyərlər (məsələn, `person_age > 100` və ya iş təcrübəsinin yaşdan böyük olması) data keyfiyyətini qorumaq məqsədilə filtirlənmiş və ya müvafiq biznes qaydalarına uyğun olaraq təmizlənmişdir.

---

## 🔒 Təhlükəsizlik və Maskalanma Qaydaları (Data Masking)
* **Production və BI Mühiti:** Power BI hesabatlarında vizuallaşdırma aparılarkən, fərdi müştəri profillərini qorumaq məqsədilə heç bir sətirdə müştərinin identifikasiya nömrəsi birbaşa göstərilmir, verilənlər yalnız aqreqasiya olunmuş (toplu) şəkildə təqdim edilir.
* **Row-Level Security (RLS):** Kredit növlərinə (`loan_intent`) və risk dərəcələrinə (`loan_grade`) görə Power BI-da rola əsaslanan giriş icazələri tətbiq olunmuşdur.