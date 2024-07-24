---
layout: nocompress
nav_order: 20
title: "Настройка заголовков"
parent: "Мини-приложения"
grand_parent: "Маркетплейс"
date: 2024-02-02 00:00:00 +0300
---

# Настройка отображения мини-приложения

Для корректной работы мини-приложения в экосистеме Инвойсбокс, сервер мини-приложения должен позволять
отображать его и связанное содержимое в iframe.

Если в своём мини-приложении при отправке ответов с сервера вы используете заголовок `Content-Security-Policy`,
то рекомендуем внести правки, чтобы поддержать его корректную работу. [Подробнее о Content Security Policy](https://developer.mozilla.org/ru/docs/Web/HTTP/CSP).

**Пример настройки Nginx**

```
add_header Content-Security-Policy "frame-ancestors 'self' *.invoicebox.ru";
```

**Пример настройки Apache**

```
Header always set Content-Security-Policy "frame-ancestors 'self' *.invoicebox.ru";
```

{: .warning }
> Обратите внимание, если в своём мини-приложении при отправке ответов с сервера вы используете заголовок
`X-Frame-Options`, то рекомендуем внести правки, чтобы поддержать корректную работу в современных браузерах.
Использование заголовка `X-Frame-Options` является устаревшей практикой и он может не поддерживаться.

---

[Читать далее &raquo;](/docs/marketplace/mini-apps/structure/){: .btn .btn-primary .mb-4 .mb-md-0 .mr-2 }
