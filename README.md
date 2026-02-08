# palet
b2b-platform/
├── docker-compose.yml
├── backend/
│   ├── cmd/main.go           # Entry point
│   ├── internal/
│   │   ├── domain/           # Entities (Product, Order, Price)
│   │   ├── service/          # Business Logic (Pricing Engine)
│   │   └── repository/       # Database (PostgreSQL) logic
│   └── Dockerfile
└── db-init/
    └── init.sql              # Tablo şemaları ve test verileri
