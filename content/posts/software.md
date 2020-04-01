+++ 
draft = true
date = 2020-03-30T19:47:18+02:00
title = "La potenza di un software open source"
description = ""
slug = "" 
tags = ["quarantena", "software"]
categories = ["tutorial"]
externalLink = ""
series = []
+++

Questo blog è completamente open source. Nato su Linux, scritto con Visual Studio Code, ospitato su Github.
Il costo di tutto questo è zero!

Se crescerà potrò magari comprare un dominio più parlante o investire di più, per ora è il mio angolo di scrittura libero e praticamente gratuito.

Per farlo basta poco e volendo si può fare anche con un pc non recente (ne ho usato uno di 5 o 6 anni fa e ho provato anche un pc più vecchio).
Le risorse richieste sono basse, sebbene con un pc più performante si vede molto meglio lo schermo, non ti stanchi e ovviamente i programmi girano più velocemente.
Tuttavia le risorse richieste sono così basse che non è un problema farlo anche con pc datati, se si ha familiarità con la riga di comando e un po di pazienza. Un monitor esterno può essere utile se cerchi un po di ergonomia :).

Per "scrivere" il sito in "linguaggio macchina", come si diceva una volta, uso Hugo, un generatore di siti statici molto leggero e funzionale.
Di fatto, una volta installato e configurato (è semplice) basterà scrivere le pagine su Visual Studio Code, come se fosse un file di testo e la magia la farà Hugo, creando le pagine html e organizzando il sito.

Ci sono molte altre funzionalità, formattazioni, tag, ecc... ma per iniziare le trascurerò, magari in futuro potremo vederle insieme.

# Requisiti

* PC con connessione a internet
* Linux installato e funzionante
* Pacchetto Git installato - Dovrebbe bastare digitare da terminale 
    `sudo apt install git`

* Visual Studio Code installato (se non sai come visita la pagina [qui](https://code.visualstudio.com/))
* Un browser funzionante (suggerisco Firefox)
* Un minimo di conoscenza di Linux e di programmazione
* Un account su [GitHub](https://github.com/) - Tranquilli è gratis :)

# Installare Hugo

Per iniziare installare Hugo sul vostro pc, a seconda del sistema operativo usato dovrete fare degli step diversi, in questa pagina trovate tutte le [info](https://gohugo.io/getting-started/installing/)

Io ho usato Linux, per cui è facile installare prima [Homebrew](https://docs.brew.sh/Homebrew-on-Linux) e poi Hugo: 

`
brew install hugo
`

Una volta installato, potrete verificare l'installazione con


`
hugo version
`

Poi create una directory in cui volete ospitare la copia locale del vostro sito, ad esempio `\home\user\Websites\prova` e poi digitate:

``
hugo new site prova
``

Ovviamente dovreste sostituire "prova" con il nome del vostro sito.

Fatto questo, scegliete un tema dal repository, ce ne sono tantissimi e gratuiti. Io ad esempio uso [Coder](https://themes.gohugo.io/hugo-coder/)

Poi installatelo sul vostro pc, generalmente si fa entrando nella directory dove state costruento il sito e digitando:

`
git init
git submodule add [repository del vostro tema] [directory di destinazione]
`

Nel mio caso sarà:
`
git submodule add https://github.com/luizdepra/hugo-coder.git themes/hugo-coder
`

Il passo successivo è editare il file configurazione `config.toml`, vi consiglio di usare Visual Studio Code per questa parte e per la compilazione poi delle varie pagine.
Sul sito del vostro tema probabilmente troverete già una configurazione base e la spiegazione di eventuali parametri da poter usare. 
E' fondamentale ovviamente indicare questo parametro nel file `config.toml`:

`
theme = "nome del tema"
`

Nel mio caso `theme = "hugo-coder"`

Per maggiori info seguite le istruzioni riportate sulla pagina del tema che avete scelto. 

La configurazione non si ferma qui perchè potrete indicare il nome del vostro sito, l'indirizzo a cui sarà possibile trovarlo e altro testo che riteniate utile aggiungere. Vi lascio [qui](https://github.com/luizdepra/hugo-coder/wiki/Configurations#complete-example) l'esempio di Coder.

# Veniamo ora al primo post!

Per crearlo basterà digitare:

`
hugo new /posts/eccoci.md
`

Hugo creerà un file che si chiamerà `eccoci.md` nella cartella `\home\user\Websites\prova\content\posts`.

Per editarlo basterà aprirlo con Visual Studio Code (è molto comoda la barra di sinistra che ci fa vedere tutti i file del sito), ad esempio così:

```
+++ 
draft = true
date = 2020-03-30T19:47:18+02:00
title = "Eccoci"
description = ""
slug = "" 
tags = ["inizio", "personale"]
categories = ["blog"]
externalLink = ""
series = []
+++
Il tuo testo qui

```

Ci sono diversi modi per compilare questa sezione del documento, magari un un prossimo post ve li illusterò, ma è fondamentale indicare il `title` ed eventualmente i `tags`.

Attenzione alla voce `draft`, se è `true` il post sarà processato da Hugo ma non sarà visibile sul sito che genererà. E' comodo da usare mentre si scrive per capire come verrà la pagina ma, una volta completata, è bene impostarlo su `false` e poi aggiornare il sito per la pubblicazione (vedremo in seguito come).

# Proviamo il sito

Una volta completato il testo del post al posto de `Il tuo testo qui`, siamo pronti a vedere se il sito funziona. 
Digitiamo:

`
hugo server -D
`

poi apriamo il browser e digitiamo `localhost:1313`.

NOTA: il flag `-D` fa sì che Hugo compili anche le pagine con il tag `draft = true`.

Se tutto è andato a buon fine dovremmo vedere una copia locale del nostro sito, compreso il nostro post in draft.

Ora possiamo aggiungere altri post, modificare con Visual Studio Code la pagina about (basta editare il file `about.md`) e divertirci a personalizzare il sito. Se si è capaci a programmare si possono anche modificare parti del tema per renderlo più adatto al proprio gusto.

# Github

Vediamo ora come pubblicare il sito online.
Bisogna avere un account e dure repository pubblici attivi, il primo sarà chiamato ad esempio `blog` e l'altro `nomeutente.github.io`, dove ovviamente nomeutente è il vostro nome utente su GitHub.
Attenzione: se volete che il vostro sito sia accessibile all'indirizzo `https://Pippo.github.io` il vostro nome utente dovrà essere Pippo e dovrete creare un repository `Pippo.github.io`.

Vediamo ora al nostro sistema ed impostiamo git per fare l'upload del sito.



`