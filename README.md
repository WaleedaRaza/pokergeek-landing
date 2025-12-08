# PokerGeek Landing Page

Static landing page for [pokergeek.ai](https://pokergeek.ai) - email waitlist signup.

## Setup

### 1. Supabase Configuration

Update `index.html` lines 808-809 with your Supabase credentials:

```javascript
const SUPABASE_URL = 'https://your-project.supabase.co';
const SUPABASE_ANON_KEY = 'your-anon-key';
```

### 2. Create Waitlist Table

Run `waitlist-table.sql` in your Supabase SQL Editor.

### 3. Deploy

Deploy to Vercel, Netlify, or any static host.

## Structure

```
landing/
├── index.html          # Main landing page
├── favicon.svg         # Browser tab icon
├── waitlist-table.sql  # Supabase table schema
├── README.md
└── assets/
    ├── cards/          # Playing card images (53 files)
    ├── chipstack/      # Chip stack SVGs for themes
    ├── screenshots/    # App preview images
    ├── logo-15.svg     # Matric theme (lime green)
    ├── logo-16.svg     # Dev theme (orange)
    ├── logo-18.svg     # Casino theme (white/green)
    ├── logo-19.svg     # High-roller theme (red)
    └── logo-dial.svg   # Simplified dial logo
```

## Themes

The page supports 4 themes (toggle buttons in top-left):
- 🎰 Casino (default) - Forest green
- 🔥 Dev - Dark with orange accents
- 💎 High-roller - Black with red/gold
- 🐍 Matric - Black with lime green

## License

Proprietary - PokerGeek © 2025

