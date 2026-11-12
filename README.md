# Stock Analyzer (Zen C + GTK4 + Cairo + Gemini)

A high-performance native desktop stock market technical analysis and AI research terminal written in the **Zen C programming language (`zc`)**, featuring **GTK4**, **Cairo 2D graphics**, and **Google Gemini 1.5 Flash AI** integration.

---

## Key Features

- **Multi-Market Coverage**:
  - **USA Equities**: `AAPL`, `NVDA`, `TSLA`, `MSFT`, `GOOGL`, `AMZN`, etc.
  - **China A-Shares (Shanghai & Shenzhen)**: Auto-formats 6-digit numeric codes:
    - Shanghai Stock Exchange (SSE): `600519` auto-resolves to `600519.SS` (*Kweichow Moutai 贵州茅台*)
    - Shenzhen Stock Exchange (SZSE): `002594` auto-resolves to `002594.SZ` (*BYD Company 比亚迪*)
    - Hong Kong Stock Exchange: `0700.HK` (*Tencent 腾讯*), `9988.HK` (*Alibaba 阿里巴巴*)
- **Deterministic Technical Indicator Engine**:
  - **20-day Simple Moving Average (SMA-20)**: Trend direction and price distance percentage.
  - **14-day Relative Strength Index (RSI-14)**: Wilder-smoothed oscillator identifying Overbought ($> 70$) and Oversold ($< 30$) zones.
  - **MACD (12, 26, 9)**: Fast EMA (12), Slow EMA (26), Signal Line (9), and Momentum Histogram.
  - **Session Flow**: Real-time intraday delta tracking and volume analysis.
- **Quantitative Recommendation Engine**:
  - Composite multi-indicator score bounded between `[-100, +100]`.
  - Actionable rating:
    - `★ STRONG BUY ★` ($\ge +50$)
    - `BUY` ($+15$ to $+49$)
    - `HOLD / NEUTRAL` ($-14$ to $+14$)
    - `SELL` ($-49$ to $-15$)
    - `★ STRONG SELL ★` ($\le -50$)
  - Model confidence estimation ($55\%$ to $92\%$).
  - Full transparent factor attribution breakdown.
- **Cairo Interactive Technical Charting**:
  - Smooth price curve with glowing cyan fill gradient.
  - Amber SMA-20 overlay.
  - Green/Red volume histogram aligned with daily price bars.
  - RSI-14 oscillator sub-panel with dashed 70/30 threshold bands.
  - Interactive mouse hover crosshair with date and price tooltip HUD.
- **Google Gemini 1.5 Flash AI Research Note**:
  - Ingests the technical indicator vectors and produces a structured Wall Street-grade equity note:
    1. Trend & Momentum Posture
    2. Key Support & Resistance Levels
    3. Catalyst & Macroeconomic Risk Factors
    4. Actionable Stance (Entry, Stop Loss, Target price)
  - Seamless fallback: If no API key is provided, the native Zen C algorithmic engine continues full operation.

---

## Project Structure

```
├── model.zc            # Core data structs: StockQuote, Timeseries, Candle, IndicatorResult, Recommendation
├── indicators.zc       # Technical indicator algorithms: SMA-20, EMA, RSI-14, MACD, and Decision Scorer
├── data_service.zc     # Real-time data pipeline (Yahoo Finance REST API, US/China ticker sanitizer)
├── gemini_service.zc   # Google Gemini 1.5 Flash client and equity prompt generator
├── main.zc             # GTK4 application, Cairo 2D chart renderer, CSS styling, and event bridge
├── tests.zc            # Unit tests for technical indicator math and recommendation rules
├── Makefile            # Build, test, and run automation
└── README.md           # Documentation
```

---

## Requirements

- **Zen C Compiler (`zc`)** installed at `/usr/local/bin/zc`
- **GTK4** (`libgtk-4-dev`)
- **Cairo** (`libcairo2-dev`)
- **curl** & **jq** for JSON data streaming

---

## Quick Start

### 1. Run Unit Tests

Verify technical indicator math (SMA, EMA, RSI, MACD, and recommendation scoring):

```bash
make test
# Or directly:
zc run tests.zc
```

### 2. Build Native Desktop Executable

```bash
make build
# Or directly:
zc build main.zc -o stock-analyzer
```

### 3. Launch Application

```bash
# Launch with optional Gemini API Key
export GEMINI_API_KEY="AIzaSy..."
./stock-analyzer
```
*(You can also paste your Gemini API Key directly into the header entry field inside the app)*

---

## Preset Watchlist Pills

The top header bar features instant one-click watch buttons:
- **`NVDA`**: NVIDIA Corp (US)
- **`AAPL`**: Apple Inc (US)
- **`TSLA`**: Tesla Inc (US)
- **`MSFT`**: Microsoft Corp (US)
- **`茅台 600519`**: Kweichow Moutai (China A-Shares)
- **`比亚迪 002594`**: BYD Company (China A-Shares)
