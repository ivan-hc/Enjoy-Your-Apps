#!/bin/sh

APP=firefox

# CREATE THE DIRECTORY
mkdir -p /opt/"$APP"
cd /opt/"$APP"

# ADD THE REMOVER
echo '#!/bin/sh' >> /opt/"$APP"/remove
echo "rm -R -f  /opt/$APP /usr/local/share/applications/$APP-stable-AM.desktop /usr/local/bin/$APP" >> /opt/"$APP"/remove
chmod a+x /opt/"$APP"/remove

# DOWNLOAD THE ARCHIVE
mkdir -p tmp
cd ./tmp

LANGUAGE=$(curl -Ls https://raw.githubusercontent.com/linuxmint/mdm/master/config/locale.alias | grep -i "$LANG" | grep -o '^\S*')
CODE=$(curl -Ls https://releases.mozilla.org/pub/$APP/releases/latest/README.txt | cut -d ':' -f2 | grep -i $LANGUAGE | cut -d '=' -f2)
wget "https://download.mozilla.org/?product=$APP-latest&os=linux64&lang=$CODE" --trust-server-names

[ -e ./*tar.* ] && tar fx ./*tar.* && rm -f ./*tar.*
cd ..
mv ./tmp/$APP/* ./
rm -R ./tmp

# LINK TO PATH
ln -s "/opt/$APP/$APP" "/usr/local/bin/$APP"

# LAUNCHER
echo "[Desktop Entry]
[Desktop Entry]
Version=1.0
Name=Firefox
GenericName=Web Browser
GenericName[ca]=Navegador web
GenericName[cs]=Webový prohlížeč
GenericName[es]=Navegador web
GenericName[fa]=مرورگر اینترنتی
GenericName[fi]=WWW-selain
GenericName[fr]=Navigateur Web
GenericName[hu]=Webböngésző
GenericName[it]=Browser Web
GenericName[ja]=ウェブ・ブラウザ
GenericName[ko]=웹 브라우저
GenericName[nb]=Nettleser
GenericName[nl]=Webbrowser
GenericName[nn]=Nettlesar
GenericName[no]=Nettleser
GenericName[pl]=Przeglądarka WWW
GenericName[pt]=Navegador Web
GenericName[pt_BR]=Navegador Web
GenericName[sk]=Internetový prehliadač
GenericName[sv]=Webbläsare
Comment=Browse the Web
Comment[ca]=Navegueu per el web
Comment[cs]=Prohlížení stránek World Wide Webu
Comment[de]=Im Internet surfen
Comment[es]=Navegue por la web
Comment[fa]=صفحات شبکه جهانی اینترنت را مرور نمایید
Comment[fi]=Selaa Internetin WWW-sivuja
Comment[fr]=Navigue sur Internet
Comment[hu]=A világháló böngészése
Comment[it]=Esplora il web
Comment[ja]=ウェブを閲覧します
Comment[ko]=웹을 돌아 다닙니다
Comment[nb]=Surf på nettet
Comment[nl]=Verken het internet
Comment[nn]=Surf på nettet
Comment[no]=Surf på nettet
Comment[pl]=Przeglądanie stron WWW
Comment[pt]=Navegue na Internet
Comment[pt_BR]=Navegue na Internet
Comment[sk]=Prehliadanie internetu
Comment[sv]=Surfa på webben
Exec=/opt/$APP/$APP %u
Terminal=false
Type=Application
Icon=/opt/$APP/browser/chrome/icons/default/default128.png
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Categories=Network;WebBrowser;
Keywords=web;browser;internet;
Actions=new-window;new-private-window;profile-manager-window;

[Desktop Action Private]
Exec=/opt/$APP/$APP --private-window %u
Name=Open a New Private Window
Name[ach]=Dirica manyen me mung
Name[af]=Nuwe privaatvenster
Name[an]=Nueva finestra privada
Name[ar]=نافذة خاصة جديدة
Name[as]=নতুন ব্যক্তিগত উইন্ডো
Name[ast]=Ventana privada nueva
Name[az]=Yeni Məxfi Pəncərə
Name[be]=Новае акно адасаблення
Name[bg]=Нов прозорец за поверително сърфиране
Name[bn-BD]=নতুন ব্যক্তিগত উইন্ডো
Name[bn-IN]=নতুন ব্যক্তিগত উইন্ডো
Name[br]=Prenestr merdeiñ prevez nevez
Name[brx]=गोदान प्राइभेट उइन्ड'
Name[bs]=Novi privatni prozor
Name[ca]=Finestra privada nova
Name[cak]=K'ak'a' ichinan tzuwäch
Name[cs]=Nové anonymní okno
Name[cy]=Ffenestr Breifat Newydd
Name[da]=Nyt privat vindue
Name[de]=Neues privates Fenster
Name[dsb]=Nowe priwatne wokno
Name[el]=Νέο παράθυρο ιδιωτικής περιήγησης
Name[en-GB]=New Private Window
Name[en-US]=New Private Window
Name[en-ZA]=New Private Window
Name[eo]=Nova privata fenestro
Name[es-AR]=Nueva ventana privada
Name[es-CL]=Nueva ventana privada
Name[es-ES]=Nueva ventana privada
Name[es-MX]=Nueva ventana privada
Name[et]=Uus privaatne aken
Name[eu]=Leiho pribatu berria
Name[fa]=پنجره ناشناس جدید
Name[ff]=Henorde Suturo Hesere
Name[fi]=Uusi yksityinen ikkuna
Name[fr]=Nouvelle fenêtre de navigation privée
Name[fy-NL]=Nij priveefinster
Name[ga-IE]=Fuinneog Nua Phríobháideach
Name[gd]=Uinneag phrìobhaideach ùr
Name[gl]=Nova xanela privada
Name[gn]=Ovetã ñemi pyahu
Name[gu-IN]=નવી ખાનગી વિન્ડો
Name[he]=חלון פרטי חדש
Name[hi-IN]=नयी निजी विंडो
Name[hr]=Novi privatni prozor
Name[hsb]=Nowe priwatne wokno
Name[hu]=Új privát ablak
Name[hy-AM]=Սկսել Գաղտնի դիտարկում
Name[id]=Jendela Mode Pribadi Baru
Name[is]=Nýr huliðsgluggi
Name[it]=Nuova finestra anonima
Name[ja]=新しいプライベートウィンドウ
Name[ja-JP-mac]=新規プライベートウインドウ
Name[ka]=ახალი პირადი ფანჯარა
Name[kk]=Жаңа жекелік терезе
Name[km]=បង្អួច​ឯកជន​ថ្មី
Name[kn]=ಹೊಸ ಖಾಸಗಿ ಕಿಟಕಿ
Name[ko]=새 사생활 보호 모드
Name[kok]=नवो खाजगी विंडो
Name[ks]=نْو پرایوٹ وینڈو&amp;
Name[lij]=Neuvo barcon privou
Name[lo]=ເປີດຫນ້າຕ່າງສວນຕົວຂື້ນມາໃຫມ່
Name[lt]=Naujas privataus naršymo langas
Name[ltg]=Jauns privatais lūgs
Name[lv]=Jauns privātais logs
Name[mai]=नया निज विंडो (W)
Name[mk]=Нов приватен прозорец
Name[ml]=പുതിയ സ്വകാര്യ ജാലകം
Name[mr]=नवीन वैयक्तिक पटल
Name[ms]=Tetingkap Persendirian Baharu
Name[my]=New Private Window
Name[nb-NO]=Nytt privat vindu
Name[ne-NP]=नयाँ निजी सञ्झ्याल
Name[nl]=Nieuw privévenster
Name[nn-NO]=Nytt privat vindauge
Name[or]=ନୂତନ ବ୍ୟକ୍ତିଗତ ୱିଣ୍ଡୋ
Name[pa-IN]=ਨਵੀਂ ਪ੍ਰਾਈਵੇਟ ਵਿੰਡੋ
Name[pl]=Nowe okno prywatne
Name[pt-BR]=Nova janela privativa
Name[pt-PT]=Nova janela privada
Name[rm]=Nova fanestra privata
Name[ro]=Fereastră privată nouă
Name[ru]=Новое приватное окно
Name[sat]=नावा निजेराक् विंडो (W )
Name[si]=නව පුද්ගලික කවුළුව (W)
Name[sk]=Nové okno v režime Súkromné prehliadanie
Name[sl]=Novo zasebno okno
Name[son]=Sutura zanfun taaga
Name[sq]=Dritare e Re Private
Name[sr]=Нови приватан прозор
Name[sv-SE]=Nytt privat fönster
Name[ta]=புதிய தனிப்பட்ட சாளரம்
Name[te]=కొత్త ఆంతరంగిక విండో
Name[th]=หน้าต่างส่วนตัวใหม่
Name[tr]=Yeni gizli pencere
Name[tsz]=Juchiiti eraatarakua jimpani
Name[uk]=Приватне вікно
Name[ur]=نیا نجی دریچہ
Name[uz]=Yangi maxfiy oyna
Name[vi]=Cửa sổ riêng tư mới
Name[wo]=Panlanteeru biir bu bees
Name[xh]=Ifestile yangasese entsha
Name[zh-CN]=新建隐私浏览窗口
Name[zh-TW]=新增隱私視窗"  > /usr/local/share/applications/"$APP"-stable-AM.desktop
