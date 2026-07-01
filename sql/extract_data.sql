-- =========================================================================
-- 1: ÜMUMİ KREDİT PORTFELİNİN DEFALUT (BATMA) NİSBƏTİ
-- Məqsəd: Bankın mövcud risk portfelinin ümumi vəziyyətini qiymətləndirmək.
-- =========================================================================

/*SELECT 
    COUNT(*) AS Total_Customers,
    SUM(CAST(loan_status AS INT)) AS Defaulted_Customers,
    ROUND((SUM(CAST(loan_status AS INT)) * 100.0) / COUNT(*), 2) AS Default_Rate_Percentage
FROM credit_risk;*/

-- =========================================================================
--Netice 32409	7088	21.870000000000

-- 📊 NƏTİCƏLƏRİN BİZNES ANALİZİ (TAPINTI 1):
-- 
-- 1. Portfelin Ümumi Həcmi: Bankın aktiv kredit bazasında 32,409 nəfər müştəri var.
-- 2. Batmış Kreditlərin Sayı: Bu müştərilərdən 7,088 nəfəri krediti geri ödəməyib (Default olub).
-- 3. Ümumi Default Rate: Bankın ümumi kredit batma nisbəti 21.87%-dir.
--
-- 💡 BİZNES QƏRARI (TÖVSİYƏ):
-- Beynəlxalq bankçılıq standartlarına görə 21.87% Default Rate həddindən artıq risklidir. 
-- Bu rəqəm bankın hər 5 kreditindən 1-nin batdığını göstərir. Təcili olaraq kredit vermə 
-- siyasəti (anderraytinq) tamamilə yenidən nəzərdən keçirilməli və risk siyasəti sərtləşdirilməlidir.
-- =========================================================================






-- =========================================================================
-- 2: EV SAHİBLİYİ STATUSUNA GÖRƏ KREDİT RİSKİNİN (DEFAULT RATE) ANALİZİ
-- Məqsəd: Müştərinin sosial vəziyyətinin kredit ödənişlərinə təsirini ölçmək.
-- =========================================================================

/*
select person_home_ownership as Home_Statusu,
count(*) as Total_Customers,

-- Hər qrupda yalnız krediti batanların (1-lərin) sayını tapırıq
sum(cast(loan_status as int)) as DefaultCreditCount,

-- Krediti batanların sayını, həmin qrupun ümumi sayına bölüb 100-ə vururuq
round((sum(cast(loan_status as int))*100.0)/count(*),2) as Deafult_Rate_Percent

from credit_risk
group by person_home_ownership*/


/*Netice
MORTGAGE	13366	1687	12.620000000000
OWN	        2563	192	    7.490000000000
RENT	    16374	5176	31.610000000000
OTHER	    106	    33	    31.130000000000*/


-- =========================================================================
-- 📊 NƏTİCƏLƏRİN BİZNES ANALİZİ (TAPINTI 2):
-- 
-- 1. RENT (Kirayəçilər) & OTHER: Portfelin ən təhlükəli hissəsidir. 
--    Kirayədə qalanların Default Rate-i 31.61%-dir. Yəni hər 3 kirayəçidən 1-i krediti batırır.
--
-- 2. OWN (Öz Evi Olanlar): Ən təhlükəsiz və güvənli seqmentdir (Default Rate: 7.49%).
--    Bu müştərilərin maliyyə sabitliyi çox yüksəkdir və bank üçün minimal risk daşıyırlar.
--
-- 3. MORTGAGE (İpotekası olanlar): Orta dərəcəli risk qrupudur (Default Rate: 12.62%).
--    Nizamlı ev ödənişi etdikləri üçün kredit intizamları kirayəçilərə nisbətən çox daha yaxşıdır.

/*💡 BİZNES QƏRARI (TÖVSİYƏ): 
Bank risk siyasətini dəyişməlidir. Kirayədə qalan (RENT) müştərilərə kredit 
verilərkən ya daha yüksək təminat (girov/zamin) tələb olunmalı, ya da risk 
premiumu artırılmalıdır. OWN kateqoriyasına isə "Pre-approved" (Öncədən təsdiqlənmiş) 
asanlaşdırılmış kredit kampaniyaları təklif edilə bilər.*/







-- =========================================================================
-- TAPINTI 3: MÜŞTƏRİLƏRİN YAŞ QRUPLARINA (SEQMENTLƏRƏ) GÖRƏ RİSK ANALİZİ
-- Məqsəd: Yaş faktorunun kredit nizam-intizamına və batma (Default) 
--          ehtimalına təsirini qruplaşdıraraq ölçmək.
-- SQL Alətləri: CASE WHEN, GROUP BY
-- =========================================================================

/*
select case
when person_age between 18 and 25 then '18-25 (Young)'
when person_age between 26 and 40 then '26-40 (Middle-Aged)'
else '41+ (Senior)'
end AgeGroup,

count(*) as AgeGroupCount,
sum(cast(loan_status as int)) as DefaultCreditCount,
round(sum(cast(loan_status as int ))*100.0/count(*),2) as AgeGroupRatePercent

from credit_risk 

group by 
case
when person_age between 18 and 25 then '18-25 (Young)'
when person_age between 26 and 40 then '26-40 (Middle-Aged)'
else '41+ (Senior)'
end*/


/*
26-40 (Middle-Aged)	15680	3244	20.690000000000
18-25 (Young)	    15243	3526	23.130000000000
41+ (Senior)	    1486	318	    21.400000000000
*/

-- =========================================================================
-- 📊 NƏTİCƏLƏRİN  ANALİZİ (TAPINTI 3):

-- 1. 18-25 (Gənclər): Gözlənildiyi kimi, portfelin ən riskli qrupudur (Default Rate: 23.13%).
--    Bu qrup həm sayca çoxdur (15,243 nəfər), həm də 3,526 batmış kreditlə ən çox ziyanı vurub.
--    Səbəb: Karyeranın başlanğıcı, qeyri-sabit gəlir və aşağı maliyyə nizam-intizamı.

-- 2. 26-40 (Orta Yaş): Ən çox kredit müraciəti edən qrupdur (15,680 nəfər).
--    Risk nisbətən daha aşağıdır (20.69%). Bu qrup bankın əsas müştəri bazasını təşkil edir.

-- 3. 41+ (Yaşlılar): Sayca çox azdırlar (cəmi 1,486 nəfər müraciət), amma risk faizi 
--    gözlənilənin əksinə olaraq orta yaşlılardan daha yüksəkdir (21.40%). 

-- 💡 BİZNES QƏRARI (TÖVSİYƏ):
-- Yaş təkbaşına kredit riskini təyin etmək üçün kəskin bir faktor deyil (faizlər bir-birinə yaxındır).
-- Amma gənclərin (18-25) kütləvi şəkildə krediti batırması (3,526 nəfər) bank üçün ciddi siqnaldır.
-- Gənclərə verilən kreditlərdə maksimum limit (məbləğ) məhdudlaşdırılmalı və skorinq sistemi sərtləşdirilməlidir.
-- =========================================================================







-- =========================================================================
-- 4: KREDİT FAİZİ VƏ BORC YÜKÜNÜN "TƏHLÜKƏLİ HƏDDİ" (CRITICAL THRESHOLD)
-- Məqsəd: Yüksek faiz və ağır borc yükünün birləşdiyi "Təhlükəli Zona"nı analiz etmək.
-- =========================================================================
/*
SELECT 
    COUNT(*) AS Dangerous_Zone_Customers,  -- Bu təhlükəli şərtə düşən ümumi müştərilər
    SUM(CAST(loan_status AS INT)) AS Defaulted_Customers, -- Onlardan krediti batanlar
    ROUND((SUM(CAST(loan_status AS INT)) * 100.0) / COUNT(*), 2) AS Critical_Default_Rate
FROM dbo.credit_risk
WHERE loan_int_rate > 12 AND loan_percent_income > 0.30 */

/*Netice   1701	  1271	  74.720000000000*/

-- =========================================================================
-- 📊 NƏTİCƏLƏRİN BİZNES ANALİZİ (TAPINTI 4):
-- 
-- 1. "Təhlükəli Zona" (Dangerous Zone) Həcmi: Həm kredit faizi 12%-dən çox olan, 
--    həm də borc yükü gəlirinin 30%-ini aşan 1,701 müştəri qeydə alınmışdır.
--
-- 2. Risk Göstəricisi: Bu spesifik qrupda Default Rate tam 74.72%-dir!
--    Ümumi portfelin batma faizindən (21.87%) təxminən 3.5 dəfə daha yüksəkdir.
--    Bu şərtlərlə kredit verilən hər 4 müştəridən 3-ü bankın pulunu geri qaytarmır.
--
-- 💡 BİZNES QƏRARI VƏ STRATEGİYA (ƏN VACİB TÖVSİYƏ):
-- Bu tapıntı bankın avtomatlaşdırılmış Kredit Skorinq və Anderraytinq sisteminə 
-- "HARD STOP" (Qəti Qadağa) qaydası kimi daxil edilməlidir:
-- Əgər bir müştərinin borc/gəlir nisbəti 30%-i keçirsə və təklif olunan faiz 12%-dən 
-- yuxarıdırsa, sistem dərhal müraciətə AVTOMATİK İMTİNA (Reject) verməlidir. 
-- Tək bu qaydanın tətbiqi bankı gələcəkdə milyonlarla manatlıq ziyandan xilas edə bilər.
-- =========================================================================




-- =========================================================================
-- 5: KREDİT REYTİNQLƏRİNƏ (LOAN GRADE) GÖRƏ RİSK ANALİZİ
-- Məqsəd: Kredit dərəcələrinin (A-G) batma faizlərini ölçərək mövcud risk 
--          skorinq modelinin nə dərəcədə doğru işlədiyini yoxlamaq.
-- =========================================================================

/*
SELECT 
    loan_grade AS Loan_Grade,
    COUNT(*) AS Total_Customers,
    SUM(CAST(loan_status AS INT)) AS Defaulted_Customers,
    ROUND((SUM(CAST(loan_status AS INT)) * 100.0) / COUNT(*), 2) AS Default_Rate_Percentage
FROM dbo.credit_risk
GROUP BY loan_grade
ORDER BY loan_grade ASC; -- A-dan G-yə doğru sıralayırıq
*/


/*Netice

A	10702	1066	9.960000000000
B	10384	1695	16.320000000000
C	6436	1336	20.760000000000
D	3619	2137	59.050000000000
E	963	    621	    64.490000000000
F	241	    170	    70.540000000000
G	64	    63	    98.440000000000
*/

-- =========================================================================
-- 📊 NƏTİCƏLƏRİN BİZNES ANALİZİ (TAPINTI 5):

-- 1. Skorinq Modelinin Effektivliyi: Model düzgün işləyir. A-dan G-yə doğru risk 
--    prosedural olaraq artır. A dərəcəsi ən güvənli (9.96%), G isə ən risklidir (98.44%).

-- 2. "D" və "E" Kateqoriyalarındakı Kritik Səhv: 
--    * D dərəcəli 3,619 nəfərə kredit verilib və onların 59.05%-i (2,137 nəfər) batıb!
--    * E dərəcəli 963 nəfərin isə 64.49%-i (621 nəfər) krediti qaytarmayıb.
--    * Bu o deməkdir ki, bank riskli olduğunu BİLDİYİ halda bu şəxslərə kütləvi kredit ayırıb.

-- 3. "G" Kateqoriyası (Faciə): G dərəcəli cəmi 64 nəfərə kredit verilib və onlardan 
--    63 nəfəri (98.44%-i!) pulu batırıb. Bu kateqoriyaya ümumiyyətlə kredit açılmamalı idi.

-- 💡 BİZNES QƏRARI VƏ STRATEGİYA:
-- 1. A, B və C reytinqli müştərilər bankın əsas gəlir mənbəyidir, onlarla iş davam etdirilməlidir.
-- 2. D, E, F və G kateqoriyalarına kredit verilməsi dərhal DAYANDIRILMALIDIR. 
--    Çünki bu qruplarda batma ehtimalı 50%-dən çoxdur (yazılmamış qanun: default ehtimalı 
--    50%-i keçən qruplara kredit verilməz, çünki bu artıq lotereya oynamaq kimidir).
-- =========================================================================