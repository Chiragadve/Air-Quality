# 🌫️ Air Quality Data Pipeline

An end-to-end pipeline to extract, transform, and analyze **air quality data** from [OpenAQ](https://openaq.org), built with Python. The project supports local ingestion, transformation, and storage in SQLite — designed to evolve into a **live dashboard** for real-time pollution insights.

> ⚠️ Note: Due to limited or missing API data for many Mumbai locations, fallback data from Damonsville is used for demonstration.

---

## 🖼️ Preview

<img src="https://img.shields.io/badge/Status-Prototype-blue?style=flat-square"/>
<img src="https://img.shields.io/badge/City-Mumbai%20(%F0%9F%87%AE%F0%9F%87%B3)-green?style=flat-square"/>
<img src="https://img.shields.io/badge/Data%20Source-OpenAQ-blue?style=flat-square"/>
<img src="https://img.shields.io/badge/Database-SQLite-lightgrey?style=flat-square"/>
<img src="https://img.shields.io/badge/Language-Python%203.10+-yellow?style=flat-square"/>

---

## 🗂️ Project Structure

```
Air-Quality/
├── pipeline/
│   ├── extraction.py        ← Download data from S3/API
│   ├── transformation.py    ← Clean and load into SQLite
│   ├── database_manager.py  ← Setup schema and tables
│   └── utils.py             ← Helper functions
├── sql/
│   ├── ddl/                 ← SQL for schema creation
│   └── dml/                 ← SQL for data processing
├── air_quality.db           ← Final database (autogenerated)
├── README.md
└── requirements.txt
```

---

## 🚀 Quickstart

### 🔧 1. Clone the Repository

```bash
git clone https://github.com/Chiragadve/Air-Quality.git
cd Air-Quality
```

### 🐍 2. Create and Activate Virtual Environment

```bash
python -m venv .venv
# Activate:
.venv\Scripts\activate  # Windows
source .venv/bin/activate  # macOS/Linux
```

### 📦 3. Install Requirements

```bash
pip install -r requirements.txt
```

### 🛠️ 4. Set Up the Database

```bash
python pipeline/database_manager.py
```

### 🔁 5. Run the Transformation Pipeline

```bash
python pipeline/transformation.py --database_path air_quality.db --query_directory sql/dml/presentation
```

---

## 📍 Location & Data Notes

✅ Bounding box was set over **Mumbai**, but due to sparse valid data from OpenAQ API/S3, most values (except PM2.5) came back as `NULL`.  
📌 For consistent testing, **Damonsville** data was used.  
🧪 Future steps will include resolving API vs S3 inconsistency and enhancing Mumbai data ingestion.

---

## 📈 Roadmap

- [ ] ✅ Build interactive dashboard (Streamlit/Dash)
- [ ] 🔁 Automate data refresh (Airflow or cron)
- [ ] 🌍 Add multi-city support
- [ ] 📉 Integrate real-time air quality alerts
- [ ] 📊 Add visual pollution trend analytics

---

## 🤝 Contributing

Contributions, bug reports, and feedback are welcome!  
Feel free to fork the repo, raise issues, or open a pull request. Let's build a clean-air future together. 🌱

---

## 🧠 Inspiration

This project is inspired by a desire to make **climate and health data more accessible** at the local level — starting with Mumbai.  
Despite data limitations, the architecture is ready to scale and go live once consistent feeds are available.

---

## 📄 License

MIT License © 2025 [Chirag Adve](https://github.com/Chiragadve)

---

> Built with ☁️ data, 🐍 Python, and a breath of fresh air.
