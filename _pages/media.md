---
layout: default
title: Media
permalink: /media/
lang_names:
  en: "English"
  jp: "Japanese"
  other: "Others"
---

<h1>{{ page.title }}</h1>
{% include media.html 
  lang_names=page.lang_names
  debug=false
  %}