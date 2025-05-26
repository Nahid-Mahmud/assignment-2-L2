## What is PostgreSQL?

PostgreSQL হলো একটি ওপেনসোর্স অবজেক্ট রিলেশনাল ডেটাবেজ সিস্টেম। এটি SQL এর উপর বেস করো বানানো একটি RDMS যা SQL এর গন্ডির বাহিরেও অনেওক ফিচার প্রদান করে। 


## What are the LIMIT and OFFSET clauses used for?

লিমিট এবং অফসেট আমরা পেজিনেশন এর সময় ব্যাবহার করতে পারি। 

যেমন ঃ 
```
SELECT * FROM users
ORDER BY id
LIMIT 10 OFFSET 0;
```
এখানে  Offset 0  এবং limit 10 তাই সুধু ১০ টা ডাটা দিবে যা হবে ১-১০। 

```
SELECT * FROM users
ORDER BY id
LIMIT 10 OFFSET 10;
```
এখানে  Offset 10  এবং limit 10 তাই সুধু ১০ টা ডাটা দিবে যা হবে 10-20। 

## Explain the GROUP BY clause and its role in aggregation operations.

GROUP BY,  PostgreSQL এ একইজাতীয় একাধিক Row কে একীভূত করে দেখায়।  এটি বিভিন্ন Aggregation অপারেশন ব্যাবহার করা যেতে পারে যেমন count(), avg() ইত্যাদি।

```
SELECT student, COUNT(*) AS student_count
FROM employees
GROUP BY student;
```

# Explain the purpose of the WHERE clause in a SELECT statement.

where কন্ডিশন রেস্ট্রিকশনের মতো কাজ করে যা ডেটা টেবিলের প্রতিটি ROW তে কন্ডিশন চেক করে এবং সঠিক রেজাল্ট পেতে সহায়তা করে। 

```
SELECT name, salary
FROM employees
WHERE salary > 50000;
```

# What is the difference between the VARCHAR and CHAR data types?

VARCHAR এবং CHAR উভয়েই আমরা ক্যারেক্টার এর সর্বোচ্চ লেন্থ বলে দিতে পারি  তবে varchar এ যতটুকু ইনপুট দেওয়া হয় ঠিক ততটুকুর জন্যই মেমরি তে জায়গা দখন করে কিন্তু  CHAR এ কম ইনপুট দিলেও সবসময় একই সমান মেমরি তে জায়গা দখল করে। 
