# Volatility & Returns Explorer

**Live URL:** https://buildthisnextonline.github.io/volatility-returns-explorer

An interactive tool for exploring how volatility and returns relate across different asset classes over time. The central thesis: volatility is a feature, not a bug — and as volatility reduces over time, so do returns.

---

## What it shows

13 assets across equities, bonds, commodities, and crypto — all on weekly data pulled live from Yahoo Finance:

| Asset | Ticker | Data from |
|---|---|---|
| S&P 500 | SPY | 2010 |
| NASDAQ | ^IXIC | 2010 |
| US Bonds | TLT | 2010 |
| Gold | GLD | 2010 |
| Silver | SLV | 2010 |
| Energy | XLE | 2010 |
| Copper | HG=F | 2010 |
| Nifty 50 (₹) | ^NSEI | 2013 |
| Nifty 50 ($) | ^NSEI + INR=X | 2013 |
| Bitcoin | BTC-USD | 2014 |
| Ethereum | ETH-USD | 2015 |

---

## Five views

- **Growth of $1** — log scale, cumulative return indexed from each asset's start date
- **Rolling Return** — 52-week annualised return over time
- **Rolling Volatility** — 52-week annualised volatility (std dev of weekly log returns × √52)
- **Drawdown** — percentage below rolling peak, showing the cost of holding through downturns
- **Risk vs Return** — scatter plot: annualised volatility (x) vs annualised return (y) per asset

Period can be set to 5Y, 10Y, or Max. Individual assets can be toggled on/off.

---

## How to update and publish

You need these three files in the same folder:

```
volatility-returns-explorer.html   ← your working file, edit this
github_setup.bat                   ← run once to set up the repo
github_push.bat                    ← run whenever you want to publish an update
```

### First-time setup (run once)

**Prerequisites:**
- [Git](https://git-scm.com/download/win) — `winget install Git.Git`
- [GitHub CLI](https://cli.github.com/) — `winget install GitHub.cli`, then `gh auth login`

Then just run:
```
github_setup.bat
```

It will initialise the local repo, copy the HTML to `index.html`, push to GitHub, enable Pages, and open the live URL automatically.

### Publishing an update

After editing `volatility-returns-explorer.html`, run:
```
github_push.bat
```

It copies the HTML to `index.html`, commits with a timestamp, pushes to GitHub, and opens the live URL. Changes are live within ~30 seconds.

---

## Notes

- The HTML file is self-contained — no build step, no dependencies, no server required once hosted
- Data is fetched live from Yahoo Finance on page load; fetch each asset individually using the buttons if any fail
- Nifty 50 ($) is computed by dividing the Nifty 50 (₹) price series by the USD/INR rate at each week
- The favicon is an inline base64-encoded SVG sine wave — no external file needed
