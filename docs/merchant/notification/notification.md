---
layout: default
title: "Обработка уведомлений"
nav_order: 50
has_children: true
parent: "Приём платежей"
permalink: docs/merchant/notification
date: 2023-10-25 00:00:00 +0300
---

# Обработка уведомлений

Система «Инвойсбокс» уведомляет Магазин о факте оплаты счёта несколькими способами. В первую очередь,
все уведомления о платежах направляются по электронной почте магазина или SMS. Ежедневно система
«Инвойсбокс» также направляет сводный реестр платежей (Переводов) за прошедшие сутки.

Если Магазину требуется получать уведомления о платежах в автоматическом режиме, например, для передачи
статуса оплаты заказа в CMS или иную систему учёта, система «Инвойсбокс» может направлять такие
уведомления по заранее заданным параметрам (ссылке). Система «Инвойсбокс» поддерживает множество
форматов уведомлений, в том числе форматы сторонних платёжных решений.

Если в системе Магазина отсутствует возможность реализации сервиса (ссылки) для получения информации
об оплате заказа, существует возможность реализации механизма уведомлений через [веб-сокеты](/docs/api/websockets/).

В текущем разделе описаны базовые форматы уведомлений.

{: .fs-6 .fw-300 }
