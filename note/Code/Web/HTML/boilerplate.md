# Boilerplate WEB
## HTML
### /index.html
```
<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Titre</title>

    <meta property="og:determiner" content="📰" />
    <meta property="og:title" content="Titre" />
    <meta property="og:type" content="siteweb" />
    <meta property="og:image" content="https://google.fr/Image" />
    <meta property="og:image:type" content="image" />
    <meta property="og:image:alt" content="logo" />
    <meta property="og:url" content="https://google.fr/URL" />
    <meta property="og:locale" content="fr_FR" />
    <meta property="og:site_name" content="Google.fr" />
    <meta property="profile:username" content="Google" />
    <meta property="og:description" content="Description" />

    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <script src="index.js"></script>
  </body>
</html>
```

---

## CSS
### /theme.css
```
:root.day {
    --background-color: rgb(30, 30, 45);
    --background-color-transparent: rgb(30, 30, 45, 0.5);
    --main-color: rgb(50, 50, 65);
    --main-color-transparent: rgba(50, 50, 65, 0.5);
    --text-color: rgb(225, 225, 225);
    --link-color: rgb(175, 175, 175);
    --second-default: rgba(255, 255, 255, 0.75);
    --second-hover: rgba(255, 255, 255, 0.5);
}

:root,
:root.dark {
    --background-color: rgb(30, 30, 30);
    --background-color-transparent: rgb(30, 30, 30, 0.5);
    --main-color: rgb(50, 50, 50);
    --main-color-transparent: rgba(50, 50, 50, 0.5);
    --text-color: rgb(225, 225, 225);
    --link-color: rgb(175, 175, 175);
    --second-default: rgba(255, 255, 255, 0.75);
    --second-hover: rgba(255, 255, 255, 0.5);
}
```

### /user-agent.css
```
body {
    margin: 0;
}

p {
    margin-block-start: 0px;
    margin-block-end: 0px;
}

li>p,
li>a,
sub>*,
del>* {
    display: inline-block;
    padding-right: 5px;
}

del>* {
    text-decoration: line-through;
}

h1>* {
    display: inline;
}

ul {
    margin-block-start: 0;
    margin-block-end: 0;
    padding-inline-start: 0;
}
```

### /font.css
```
@font-face {
    font-family: Roboto;
    src: url(/assets/font/Roboto-Regular.ttf);
}

b,
summary {
    font-family: Varela;

    font-size: x-large;
    font-weight: bolder;
}

i {
    font-style: italic;
}

p,
del,
i,
li,
u {
    font-family: Varela;

    font-size: larger;
    font-weight: normal;
}

a {
    font-family: Varela;

    font-size: larger;
    font-weight: bold;

    text-decoration: underline;
}

h1,
h2,
h3,
h4,
h5,
h6 {
    font-family: Varela;
    color: var(--text-color);
}

h1 {
    font-size: xx-large;
    font-weight: bolder;
}

h2 {
    font-size: x-large;
    font-weight: bold;
}

p,
b,
del,
i,
li,
u {
    color: var(--text-color);
}
```

---

## JS
### /index.js
```
```
