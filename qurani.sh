#!/bin/bash

# --- data surahs ---
declare -a surah_ar=(
"الفاتحة" "البقرة" "آل عمران" "النساء" "المائدة" "الأنعام" "الأعراف" "الأنفال" "التوبة" "يونس"
"هود" "يوسف" "الرعد" "إبراهيم" "الحجر" "النحل" "الإسراء" "الكهف" "مريم" "طه"
"الأنبياء" "الحج" "المؤمنون" "النور" "الفرقان" "الشعراء" "النمل" "القصص" "العنكبوت" "الروم"
"لقمان" "السجدة" "الأحزاب" "سبأ" "فاطر" "يس" "الصافات" "ص" "الزمر" "غافر" "فصلت"
"الشورى" "الزخرف" "الدخان" "الجاثية" "الأحقاف" "محمد" "الفتح" "الحجرات" "ق" "الذاريات"
"الطور" "النجم" "القمر" "الرحمن" "الواقعة" "الحديد" "المجادلة" "الحشر" "الممتحنة" "الصف"
"الجمعة" "المنافقون" "التغابن" "الطلاق" "التحريم" "الملك" "القلم" "الحاقة" "المعارج" "نوح"
"الجن" "المزمل" "المدثر" "القيامة" "الإنسان" "المرسلات" "النبأ" "النازعات" "عبس"
"التكوير" "الانفطار" "المطففين" "الانشقاق" "البروج" "الطارق" "الأعلى" "الغاشية" "الفجر" "البلد"
"الشمس" "الليل" "الضحى" "الشرح" "التين" "العلق" "القدر" "البينة" "الزلزلة" "العاديات"
"القارعة" "التكاثر" "العصر" "الهمزة" "الفيل" "قريش" "الماعون" "الكوثر" "الكافرون" "النصر"
"المسد" "الإخلاص" "الفلق" "الناس"
)

declare -a surah_en=(
"Al-Fatiha" "Al-Baqara" "Aal-Imran" "An-Nisa" "Al-Maida" "Al-Anam" "Al-Araf" "Al-Anfal" "At-Tawba" "Yunus"
"Hud" "Yusuf" "Ar-Rad" "Ibrahim" "Al-Hijr" "An-Nahl" "Al-Isra" "Al-Kahf" "Maryam" "Taha"
"Al-Anbiya" "Al-Hajj" "Al-Muminun" "An-Nur" "Al-Furqan" "Ash-Shuara" "An-Naml" "Al-Qasas" "Al-Ankabut" "Ar-Rum"
"Luqman" "As-Sajda" "Al-Ahzab" "Saba" "Fatir" "Ya-Sin" "As-Saffat" "Sad" "Az-Zumar" "Ghafir"
"Fussilat" "Ash-Shura" "Az-Zukhruf" "Ad-Dukhan" "Al-Jathiya" "Al-Ahqaf" "Muhammad" "Al-Fath" "Al-Hujurat" "Qaf"
"Adh-Dhariyat" "At-Tur" "An-Najm" "Al-Qamar" "Ar-Rahman" "Al-Waqia" "Al-Hadid" "Al-Mujadila" "Al-Hashr" "Al-Mumtahina"
"As-Saff" "Al-Jumua" "Al-Munafiqun" "At-Taghabun" "At-Talaq" "At-Tahrim" "Al-Mulk" "Al-Qalam" "Al-Haqqa" "Al-Maarij"
"Nuh" "Al-Jinn" "Al-Muzzammil" "Al-Muddathir" "Al-Qiyama" "Al-Insan" "Al-Mursalat" "An-Naba" "An-Naziat" "Abasa"
"At-Takwir" "Al-Infitar" "Al-Mutaffifin" "Al-Inshiqaq" "Al-Buruj" "At-Tariq" "Al-Ala" "Al-Ghashiya" "Al-Fajr" "Al-Balad"
"Ash-Shams" "Al-Lail" "Ad-Duha" "Ash-Sharh" "At-Tin" "Al-Alaq" "Al-Qadr" "Al-Bayyina" "Az-Zalzalah" "Al-Adiyat"
"Al-Qaria" "At-Takathur" "Al-Asr" "Al-Humazah" "Al-Fil" "Quraish" "Al-Maun" "Al-Kawthar" "Al-Kafiroon" "An-Nasr"
"Al-Masad" "Al-Ikhlas" "Al-Falaq" "An-Nas"
)

# --- data reciters---
declare -A reciters
reciters=(
  ["afs"]="مشاري العفاسي|Mishary Alafasy"
  ["hus"]="ماهر المعيقلي|Maher Al Muaiqly"
  ["abd"]="عبد الباسط|Abdulbasit Abdussamad"
)

# --- colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BOLD='\033[1m'
YELLOW='\033[1;33m'
NC='\033[0m' # لا لون

# --- Banner Qurani ---
banner() {
  echo -e "${CYAN}${BOLD}"
  echo " ________                                              .__  .__  "
  echo " \_____  \  __ ______________    ____             ____ |  | |__| "
  echo "  /  / \  \|  |  \_  __ \__  \  /    \   ______ _/ ___\|  | |  | "
  echo " /   \_/.  \  |  /|  | \// __ \|   |  \ /_____/ \  \___|  |_|  | "
  echo " \_____\ \_/____/ |__|  (____  /___|  /          \___  >____/__| "
  echo "        \__>                 \/     \/               \/          "
  echo -e "${NC}${YELLOW}                    Qurani CLI by Mahdi Debbah${NC}\n"
  echo -e "${GREEN}مرحبا بك في Qurani - اسمع القرآن من الترمنال!${NC}"
  echo -e "${BOLD}الأوامر المتوفرة:${NC}"
  echo -e "  ${YELLOW}list-surahs${NC}    - عرض جميع السور (بالأرقام، العربية والإنجليزية)"
  echo -e "  ${YELLOW}list-reciters${NC}  - عرض قائمة القراء المتوفرين"
  echo -e "  ${YELLOW}play <sura> [reciter]${NC} - تشغيل سورة برقمها أو اسمها (عربي أو إنجليزي) واختيار القارئ"
  echo -e "\n${CYAN}أمثلة استعمال:${NC}"
  echo -e "  qurani play الفاتحة"
  echo -e "  qurani play 2 hus"
  echo -e "  qurani play Al-Baqara abd"
  echo -e "\n${YELLOW}ملاحظة:${NC} إذا لم تحدد القارئ سيُشغل مشاري العفاسي تلقائيا."
  echo -e "\n${BOLD}برمجة: مهدي دبّاح / Mahdi Debbah${NC}"
  echo -e "\n${GREEN}Help in English:${NC}"
  echo -e "${BOLD}Available commands:${NC}"
  echo -e "  ${YELLOW}list-surahs${NC}    - Show all Surahs (with number, Arabic & English name)"
  echo -e "  ${YELLOW}list-reciters${NC}  - List available reciters"
  echo -e "  ${YELLOW}play <sura> [reciter]${NC} - Play a surah by number, Arabic or English name, and choose reciter"
  echo -e "\n${CYAN}Usage examples:${NC}"
  echo -e "  qurani play Al-Fatiha"
  echo -e "  qurani play 2 hus"
  echo -e "  qurani play Al-Baqara abd"
  echo -e "\n${YELLOW}Note:${NC} If you don't specify the reciter, Mishary Alafasy will be used by default."
  echo -e "\n${BOLD}Developed by: Mahdi Debbah${NC}"
}

# --- help functions---
list_surahs() {
  printf "%-4s | %-20s | %-20s\n" "No" "Arabic" "English"
  echo "---------------------------------------------------------------"
  for i in "${!surah_ar[@]}"; do
    printf "%03d  | %-20s | %-20s\n" $((i+1)) "${surah_ar[$i]}" "${surah_en[$i]}"
  done
}

list_reciters() {
  printf "%-6s | %-20s | %-25s\n" "ID" "Arabic" "English"
  echo "-------------------------------------------------------------"
  for id in "${!reciters[@]}"; do
    IFS="|" read -r ar en <<< "${reciters[$id]}"
    printf "%-6s | %-20s | %-25s\n" "$id" "$ar" "$en"
  done
}

get_surah_number() {
  arg=$(echo "$1" | tr '[:upper:]' '[:lower:]')
  for i in "${!surah_ar[@]}"; do
    if [[ "$arg" == "${surah_ar[$i]}" ]] || [[ "$arg" == "${surah_en[$i],,}" ]] || [[ "$arg" == $((i+1)) ]]; then
      echo $((i+1))
      return
    fi
  done
  echo ""
}

get_reciter_id() {
  arg=$(echo "$1" | tr '[:upper:]' '[:lower:]')
  for id in "${!reciters[@]}"; do
    IFS="|" read -r ar en <<< "${reciters[$id]}"
    if [[ "$arg" == "$id" ]] || [[ "$arg" == "${ar,,}" ]] || [[ "$arg" == "${en,,}" ]]; then
      echo "$id"
      return
    fi
  done
  echo ""
}

play_surah() {
  surah_arg="$1"
  reciter_arg="$2"
  surah_num=$(get_surah_number "$surah_arg")
  reciter_id=$(get_reciter_id "$reciter_arg")
  if [[ -z $surah_num ]]; then
    echo -e "${RED}❌ سورة غير موجودة! استخدم list-surahs${NC}"
    exit 1
  fi
  if [[ -z $reciter_id ]]; then
    echo -e "${RED}❌ قارئ غير موجود! استخدم list-reciters${NC}"
    exit 1
  fi
  url="https://server8.mp3quran.net/${reciter_id}/$(printf "%03d" $surah_num).mp3"
  echo -e "${GREEN}▶️ تشغيل: ${surah_en[$((surah_num-1))]} (${surah_ar[$((surah_num-1))]}) - ${reciters[$reciter_id]}${NC}"
  if command -v mpv &>/dev/null; then
    mpv --no-video "$url"
  elif command -v vlc &>/dev/null; then
    cvlc --play-and-exit "$url"
  else
    echo -e "${RED}يرجى تثبيت mpv أو vlc${NC}"
    exit 1
  fi
}

# --- commands---
if [[ $# -eq 0 ]]; then
  banner
  exit 0
fi

case "$1" in
  list-surahs)
    list_surahs
    ;;
  list-reciters)
    list_reciters
    ;;
  play)
    if [[ -z "$2" ]]; then banner; exit 1; fi
    play_surah "$2" "${3:-afs}"
    ;;
  *)
    banner
    ;;
esac
