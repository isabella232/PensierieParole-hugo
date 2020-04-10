+++ 
draft = false
date = 2020-03-30T19:47:18+02:00
title = "Un sito gratis grazie al software open source"
description = ""
slug = "" 
tags = ["quarantena", "software"]
categories = ["tutorial"]
externalLink = ""
series = []
+++

Questo blog è completamente open source. Nato su Linux, scritto con Visual Studio Code, ospitato su Github.
Il costo di tutto questo è zero! Non sono un programmatore nè un tecnico dell'IT ma con un po di passione, pazienza (molta) e un po di tempo penso che ci possa riuscire chiunque. Visto che ci ho messo parecchio tempo e che forse non tutti sono in grado di leggere guide su internet in inglese o video in lingua su Youtube ho pensato di creare questa guida.

Se questo sito crescerà potrò magari comprare un dominio più "parlante" o investire di più, per ora è il mio angolo di scrittura libero ed è praticamente gratuito.

Per fare un sito simile basta poco e, volendo, si può fare anche con un pc non recente (ne ho usato uno di 5 o 6 anni fa e ho provato anche un pc più vecchio).
Le risorse richieste sono basse, sebbene con un pc più performante si vede molto meglio lo schermo, non ti stanchi e ovviamente i programmi girano più velocemente.

Per "scrivere" il sito in "linguaggio macchina", come si diceva una volta, uso Hugo, un generatore di siti statici molto leggero e funzionale.
Di fatto, una volta installato e configurato (è semplice), basterà scrivere le pagine su un editor come se fosse un file di testo e la magia la farà Hugo, creando le pagine html e organizzando il sito.

Ci sono molte altre funzionalità, formattazioni, tag, ecc... ma per iniziare le trascurerò, magari in futuro potremo vederle insieme.

# Requisiti

* PC con connessione a internet
* Linux installato e funzionante (per semplicità suggerisco Ubuntu o derivate)
* Pacchetto Git installato - Dovrebbe bastare digitare da terminale 
    `sudo apt install git`

* Visual Studio Code installato (se non sai come visita la pagina [qui](https://code.visualstudio.com/) ma puoi usare anche altri editor come Atom)
* Un browser funzionante (suggerisco Firefox)
* Un minimo di conoscenza di Linux e di programmazione
* Un account su [GitHub](https://github.com/) - Tranquilli è gratis :)

Tutti i software citati qui sono open source e gratis, questo secondo me è il bello di Internet e della comunità opensource!


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

Poi create una directory in cui volete ospitare la copia locale del vostro sito, ad esempio `/home/user/Websites/prova`, dove "prova" è la directory dove sarà sviluppato il vostro sito e poi digitate:

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

Altra cosa importantissima da indicare in `config.toml` è il seguente parametro, che indica l'indirizzo del nostro futuro sito:

`
baseURL = "https://nomeutente.github.io/"
`

Per maggiori info sulla compilazione di `config.toml` seguite le istruzioni riportate sulla pagina del tema che avete scelto, probabilmente ci sarà anche un esempio da copiare ed adattare.

Nella prossima sezione invece vi spiegherò meglio perchè bisogna scrivere l'indirizzo in questo modo, ricordatevi che "nomeutente" è il nome con cui vi registrerete (o vi siete registrati) in GitHub, quindi usate un nome appropriato! 

La configurazione non si ferma qui perchè potrete indicare il nome del vostro sito, l'indirizzo a cui sarà possibile trovarlo e altro testo che riteniate utile aggiungere. Vi lascio [qui](https://github.com/luizdepra/hugo-coder/wiki/Configurations#complete-example) l'esempio di Coder.

# Veniamo ora al primo post!

Per crearlo basterà digitare:

`
hugo new /posts/eccoci.md
`

Hugo creerà un file che si chiamerà `eccoci.md` nella cartella `/home/user/Websites/prova/content/posts`.

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
Attenzione: se volete che il vostro sito sia accessibile all'indirizzo `https://Pippo.github.io` il vostro nome utente dovrà essere "Pippo" e dovrete creare un repository `Pippo.github.io`.

Ogni repository ha un link specifico in questo formato:

`https://github.com/nomeutente/repository.git`

Se ad esempio volete lavorare sul repository blog, il link sarà `https://github.com/nomeutente/blog.git`.
Questo link si trova sulla pagina del repository, in alto a destra cliccando sul tasto "Clone or download", andate nella pagina e copiatelo.

Vediamo ora al nostro sistema ed impostiamo git per fare l'upload del sito.

Entrate nella cartella del vostro sito, ad esempio `/home/user/Websites/prova/` e scrivete:

```
git remote add origin https://github.com/nomeutente/repository.git
git pull origin master
```
A questo punto bisogna editare un file di configurazione di Git, digitando:

`
vim .gitignore
`

In alternativa a Vim si può usare Visual Studio Code.
Qui scriveremo semplicemente

```
public\
```

Di seguito andremo ad aggiungere i file al nostro repository:

```
git add --all
git status
git commit -m "initial commit"
git push -u origin master
```
Andate ora sul vostro repository, nella pagina di GitHub. Vedrete che ora repository è stato popolato dal contenuto della directory `/home/user/Websites/prova/` del vostro pc. 

Quanto sopra serve a salvare tutto il nostro lavoro mano a mano che svilupperemo il sito e per avere i sorgenti sempre a portata di mano.

Ma manca ancora qualcosa...

Ora andiamo nel secondo repository, quello chiamato `nomeutente.github.io`, recuperiamo il link http del repository come prima e digitiamo:

```
git clone https://github.com/nomeutente/nomeutente.github.io.git
```

Questo creerà una directory chiamata `/nomeutente.github.io` in `/home/user/Websites/prova/`.

Ora inizializziamo questo repository:
```
cd nomeutente.github.io.git
git pull origin master
cd ..
```
Ora diremo a Hugo di costruire il nuovo sito nella directory appena inizializzata: 
```
hugo -d ./nomeutente.github.io
```
Infine proviamo a caricare il contenuto del sito sul repository di GitHub:
```
cd ./nomeutente.github.io
git status
git add --all
git commit -m "Initial commit"
git push origin master
```
Ora anche il repository del sito è popolato andate nel vostro account di GitHub, selezionate il repository `nomeutente.github.io` e cliccate in alto a destra su **Settings**, scorrete la pagina in basso fino alla sezione **GitHub Pages**, se tutto sarà andato a buon fine vedrete la scritta verde:

`
Your site is published at https://nomeutente.github.io/
`
# Automatizziamo il caricamento

Ora che funziona tutto possiamo automatizzare il caricamento del sito, per cui lavoreremo in locale per scrivere i nuovi post e testarli e poi caricheremo la versione aggiornata in un secondo momento.

Ho creato un piccolo script per automatizzare il tutto, per crearlo basta digitare nella directory `/home/user/Websites/prova/`:

```
touch deploy.sh
chmod +x deploy.sh
```
Poi editate il file `deploy.sh` con Vim o con Visual Studio Code, inserendo il seguente codice:
```
#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo -d ./nomeutente.github.io

# Go To Public folder
cd ./nomeutente.github.io/

# Check status
git status

# Add changes to git.
git add --all

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.

git push origin master
```
Fatto!
Buon divertimento e fatemi sapere se funziona!

K.

NOTA: 
potrebbe capitare che il comando git a volte dia degli errori se non si segue tutta la procedura o se vi siano repository precedenti. In tal caso un buon aiuto per me che non sono un esperto è stato ricercare su Internet il messaggio di errore ricevuto e provare a riparare con i suggerimenti trovati la situazione.