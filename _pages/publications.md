---
layout: default
title: Publications
description: "Takuya Sasatani's publication page."
keywords: "Takuya Sasatani, 笹谷拓也, research, publications"
permalink: /publications/
type_names:
  journal-en: "Journal articles (peer-reviewed)"
  conference-en-full: "Conference (full paper, peer-reviewed)"
  invited: "Invited talks/seminars"
  tutorial: "Magazines/tutorials"
  conference-en-adjunct: "Conferences (workshop, adjunct, demo, poster, etc.)"
  conference-jp: "Japanese conference"
  patent: "Patent"
  dissertation: "Dissertation"
---

<h1>{{ page.title }}</h1>
{% include publication_list.html 
   context='publist'
   type_names=page.type_names
   debug=false
   toc=false %}