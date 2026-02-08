CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Firmalar
CREATE TABLE organizations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    type TEXT CHECK (type IN ('BUYER', 'SELLER'))
);

-- Ürünler
CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    seller_id UUID REFERENCES organizations(id),
    sku TEXT UNIQUE,
    base_price DECIMAL(12,2) NOT NULL
);

-- Dinamik Fiyat Kuralları (Core Logic)
CREATE TABLE price_rules (
    id SERIAL PRIMARY KEY,
    product_id UUID REFERENCES products(id),
    target_org_id UUID REFERENCES organizations(id), -- Belirli bir firmaya özel mi?
    min_qty INT DEFAULT 1,                           -- Tiered pricing
    discount_percent DECIMAL(5,2),
    active BOOLEAN DEFAULT true
);
