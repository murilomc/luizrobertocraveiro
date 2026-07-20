<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="pt-BR">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Sitemap | Dr. Luiz Roberto Craveiro Campos</title>
        <style><![CDATA[
          :root {
            --bg: #f6f3ed;
            --surface: #fff;
            --text: #1c2a29;
            --muted: #65706e;
            --accent: #846f55;
            --line: #ddd7cd;
            --shadow: 0 20px 55px rgba(38, 47, 45, .10);
          }
          * { box-sizing: border-box; }
          body {
            margin: 0;
            font-family: Inter, Arial, Helvetica, sans-serif;
            background: var(--bg);
            color: var(--text);
            line-height: 1.55;
          }
          main {
            width: min(calc(100% - 32px), 1080px);
            margin: 0 auto;
            padding: 56px 0;
          }
          .hero {
            margin-bottom: 28px;
          }
          .eyebrow {
            margin: 0 0 12px;
            color: var(--accent);
            font-size: .78rem;
            font-weight: 800;
            letter-spacing: .16em;
            text-transform: uppercase;
          }
          h1 {
            margin: 0 0 14px;
            font-family: Georgia, "Times New Roman", serif;
            font-size: clamp(2.4rem, 6vw, 4.8rem);
            line-height: 1.05;
            font-weight: 500;
          }
          p {
            max-width: 720px;
            color: var(--muted);
            font-size: 1.06rem;
          }
          .summary {
            display: inline-flex;
            align-items: center;
            min-height: 42px;
            padding: 0 18px;
            border-radius: 999px;
            background: var(--surface);
            border: 1px solid var(--line);
            color: var(--accent);
            font-weight: 800;
          }
          .card {
            overflow: hidden;
            border: 1px solid var(--line);
            border-radius: 22px;
            background: var(--surface);
            box-shadow: var(--shadow);
          }
          table {
            width: 100%;
            border-collapse: collapse;
          }
          th, td {
            padding: 18px 20px;
            border-bottom: 1px solid var(--line);
            text-align: left;
            vertical-align: top;
          }
          th {
            color: var(--text);
            font-size: .78rem;
            letter-spacing: .12em;
            text-transform: uppercase;
            background: #eee8df;
          }
          tr:last-child td { border-bottom: 0; }
          a {
            color: var(--accent);
            font-weight: 800;
            text-decoration: none;
            overflow-wrap: anywhere;
          }
          a:hover { text-decoration: underline; }
          .meta {
            color: var(--muted);
            white-space: nowrap;
          }
          footer {
            margin-top: 24px;
            color: var(--muted);
            font-size: .95rem;
          }
          @media (max-width: 720px) {
            main { padding: 36px 0; }
            table, thead, tbody, tr, th, td { display: block; }
            thead { display: none; }
            tr {
              padding: 16px 18px;
              border-bottom: 1px solid var(--line);
            }
            tr:last-child { border-bottom: 0; }
            td {
              padding: 6px 0;
              border: 0;
            }
            td::before {
              content: attr(data-label);
              display: block;
              margin-bottom: 2px;
              color: var(--muted);
              font-size: .72rem;
              font-weight: 800;
              letter-spacing: .1em;
              text-transform: uppercase;
            }
            .meta { white-space: normal; }
          }
        ]]></style>
      </head>
      <body>
        <main>
          <section class="hero">
            <p class="eyebrow">Sitemap XML</p>
            <h1>Mapa do site</h1>
            <p>Lista das páginas públicas enviadas aos mecanismos de busca para facilitar a indexação do site.</p>
            <div class="summary">
              <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/> URLs publicadas
            </div>
          </section>

          <section class="card">
            <table>
              <thead>
                <tr>
                  <th>URL</th>
                  <th>Atualização</th>
                  <th>Frequência</th>
                  <th>Prioridade</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="sitemap:urlset/sitemap:url">
                  <tr>
                    <td data-label="URL">
                      <a href="{sitemap:loc}">
                        <xsl:value-of select="sitemap:loc"/>
                      </a>
                    </td>
                    <td class="meta" data-label="Atualização">
                      <xsl:value-of select="sitemap:lastmod"/>
                    </td>
                    <td class="meta" data-label="Frequência">
                      <xsl:value-of select="sitemap:changefreq"/>
                    </td>
                    <td class="meta" data-label="Prioridade">
                      <xsl:value-of select="sitemap:priority"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </section>

          <footer>
            Dr. Luiz Roberto Craveiro Campos | Odontologia em Brasília
          </footer>
        </main>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

