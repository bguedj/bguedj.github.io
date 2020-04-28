---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---

TBC

You can find my publications on the following systems.



<a href="{{ author.arxiv }}"><i class="ai ai-fw ai-arxiv"></i> arXiv</a> &bull;
<a href="{{ author.dblp }}"><i class="ai ai-fw ai-dblp"></i> dblp</a> &bull;
<a href="{{ author.googlescholar }}"><i class="ai ai-fw ai-google-scholar"></i> ResearchGate</a> &bull;
<a href="{{ https://www.mendeley.com/profiles/benjamin-guedj2/ }}"><i class="ai ai-fw ai-mendeley"></i> Mendeley</a> &bull;
<a href="{{ author.orcid }}"><i class="ai ai-fw ai-orcid"></i> ORCID</a> &bull;
<a href="{{ https://publons.com/researcher/3156326/benjamin-guedj/ }}"><i class="ai ai-fw ai-publons"></i> Publons</a> &bull;
<a href="{{ author.researchgate }}"><i class="ai ai-fw ai-researchgate"></i> ResearchGate</a> &bull;
<a href="{{ https://www.semanticscholar.org/author/Benjamin-Guedj/3383281 }}"><i class="ai ai-fw ai-semantic-scholar"></i> Semantic Scholar</a>


<!-- [arXiv](https://arxiv.org/a/guedj_b_1.html) -->

<!-- [dblp](https://dblp.uni-trier.de/pers/hd/g/Guedj:Benjamin) -->

<!-- [HAL](https://haltools.inria.fr/Public/afficheRequetePubli.php?auteur_exp=Benjamin%2C+Guedj&CB_auteur=oui&CB_titre=oui&CB_identifiant=oui&CB_article=oui&CB_DOI=oui&CB_typdoc=oui&langue=Anglais&tri_exp=annee_publi&tri_exp2=typdoc&tri_exp3=date_publi&ordre_aff=AT&Fen=Aff&css=../css/styles_publicationsHAL.css) -->

[Iris](http://iris.ucl.ac.uk/iris/browse/profile?upi=BGUED94)

<!-- [ResearchGate](https://www.researchgate.net/profile/Benjamin_Guedj) -->

<!-- [Google Scholar](https://scholar.google.fr/citations?user=q-JTC2sAAAAJ&hl=fr) -->

<!-- [ORCID](https://orcid.org/0000-0003-1237-7430) -->



{% if author.googlescholar %}
  You can also find my articles on <u><a href="{{author.googlescholar}}">my Google Scholar profile</a>.</u>
{% endif %}

{% include base_path %}

<!-- {% for post in site.publications reversed %}
  {% include archive-single.html %}
{% endfor %} -->

{% assign current_year = "" %}
{% for post in site.publications reversed %}
  {% assign year = post.date | date: "%Y" %}
  <!-- {% if current_year != year %}
    {% assign current_year = year %}
    {% include archive-subheader.html %}
  {% endif %} -->
  {% include archive-single.html %}
{% endfor %}
