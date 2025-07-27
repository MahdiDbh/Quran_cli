#!/bin/bash

# Startup splash screen
startup_splash() {
  clear
  echo -e "${LIGHT_CYAN}${BOLD}"
  echo "                    🕌 QURANI CLI STARTING... 🕌"
  echo -e "${NC}"
  
  # Simple loading animation
  echo -n -e "${YELLOW}Loading"
  for i in {1..3}; do
    sleep 0.3
    echo -n "."
  done
  echo -e " ${LIGHT_GREEN}Done!${NC}\n"
  sleep 0.5
}

# Show startup splash only if running interactively
if [[ $# -gt 0 ]] && [[ "$1" != "--no-splash" ]]; then
  startup_splash
fi

# --- data surahs---
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
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
WHITE='\033[1;37m'
LIGHT_GREEN='\033[1;32m'
LIGHT_BLUE='\033[1;34m'
LIGHT_CYAN='\033[1;36m'
LIGHT_YELLOW='\033[1;33m'
DIM='\033[2m'
UNDERLINE='\033[4m'
BLINK='\033[5m'
NC='\033[0m' # لا لون

# --- Banner Qurani ---
banner() {
  clear
  echo -e "${LIGHT_CYAN}${BOLD}"
  echo "╔══════════════════════════════════════════════════════════════════════════════╗"
  echo "║                                                                              ║"
  echo "║  ________                                              .__  .__              ║"
  echo "║  \_____  \  __ ______________    ____             ____ |  | |__|             ║"
  echo "║   /  / \  \|  |  \_  __ \__  \  /    \   ______ _/ ___\|  | |  |             ║"
  echo "║  /   \_/.  \  |  /|  | \// __ \|   |  \ /_____/ \  \___|  |_|  |             ║"
  echo "║  \_____\ \_/____/ |__|  (____  /___|  /          \___  >____/__|             ║"
  echo "║         \__>                 \/     \/               \/                      ║"
  echo "║                                                                              ║"
  echo "╚══════════════════════════════════════════════════════════════════════════════╝"
  echo -e "${NC}"
  
  # Animated title
  echo -e "${YELLOW}${BOLD}                    🕌 Qurani CLI by Mahdi Debbah 🕌${NC}\n"
  
  # Beautiful separator
  echo -e "${LIGHT_CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  
  echo -e "${LIGHT_GREEN}${BOLD}✨ مرحبا بك في Qurani - اسمع القرآن من الترمنال! ✨${NC}"
  echo -e "${LIGHT_CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  
  echo -e "${WHITE}${BOLD}📋 الأوامر المتوفرة:${NC}"
  echo -e "  ${LIGHT_YELLOW}📜 list-surahs${NC}     - عرض جميع السور (بالأرقام، العربية والإنجليزية)"
  echo -e "  ${LIGHT_YELLOW}🎙️  list-reciters${NC}   - عرض قائمة القراء المتوفرين"
  echo -e "  ${LIGHT_YELLOW}▶️  play <sura> [reciter]${NC} - تشغيل سورة برقمها أو اسمها واختيار القارئ"
  
  echo -e "\n${LIGHT_CYAN}${BOLD}💡 أمثلة استعمال:${NC}"
  echo -e "  ${LIGHT_GREEN}qurani play الفاتحة${NC}"
  echo -e "  ${LIGHT_GREEN}qurani play 2 hus${NC}"
  echo -e "  ${LIGHT_GREEN}qurani play Al-Baqara abd${NC}"
  
  echo -e "\n${YELLOW}${BLINK}⚠️${NC} ${YELLOW}ملاحظة:${NC} إذا لم تحدد القارئ سيُشغل مشاري العفاسي تلقائيا."
  
  echo -e "\n${DIM}${BOLD}👨‍💻 برمجة: مهدي دبّاح / Mahdi Debbah${NC}"
  
  # English section with beautiful formatting
  echo -e "\n${LIGHT_CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${LIGHT_GREEN}${BOLD}🌟 Help in English 🌟${NC}"
  echo -e "${LIGHT_CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  
  echo -e "${WHITE}${BOLD}📋 Available commands:${NC}"
  echo -e "  ${LIGHT_YELLOW}📜 list-surahs${NC}     - Show all Surahs (with number, Arabic & English name)"
  echo -e "  ${LIGHT_YELLOW}🎙️  list-reciters${NC}   - List available reciters"
  echo -e "  ${LIGHT_YELLOW}▶️  play <sura> [reciter]${NC} - Play a surah by number, Arabic or English name"
  
  echo -e "\n${LIGHT_CYAN}${BOLD}💡 Usage examples:${NC}"
  echo -e "  ${LIGHT_GREEN}qurani play Al-Fatiha${NC}"
  echo -e "  ${LIGHT_GREEN}qurani play 2 hus${NC}"
  echo -e "  ${LIGHT_GREEN}qurani play Al-Baqara abd${NC}"
  
  echo -e "\n${YELLOW}${BLINK}⚠️${NC} ${YELLOW}Note:${NC} If you don't specify the reciter, Mishary Alafasy will be used by default."
  echo -e "\n${DIM}${BOLD}👨‍💻 Developed by: Mahdi Debbah${NC}"
  
  # Final beautiful separator
  echo -e "${LIGHT_CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
}

# --- دوال المساعدة ---

# Loading animation function
show_loading() {
  local message="$1"
  local delay=0.1
  local chars="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
  
  echo -n -e "${LIGHT_CYAN}${message}${NC} "
  for (( i=0; i<20; i++ )); do
    for (( j=0; j<${#chars}; j++ )); do
      echo -n -e "${YELLOW}${chars:$j:1}${NC}"
      sleep $delay
      echo -n -e "\b"
    done
  done
  echo -e " ${LIGHT_GREEN}✓${NC}"
}

# Progress bar function
show_progress() {
  local duration=$1
  local bar_length=50
  local progress=0
  
  echo -n -e "${LIGHT_CYAN}Progress: ${NC}["
  
  for (( i=0; i<=bar_length; i++ )); do
    if (( i <= progress )); then
      echo -n -e "${LIGHT_GREEN}█${NC}"
    else
      echo -n -e "${DIM}▒${NC}"
    fi
  done
  
  echo -e "] ${LIGHT_GREEN}100%${NC}"
}

list_surahs() {
  echo -e "${LIGHT_CYAN}${BOLD}"
  echo "╔══════════════════════════════════════════════════════════════════════════════╗"
  echo "║                           📖 قائمة السور - Surahs List 📖                    ║"
  echo "╚══════════════════════════════════════════════════════════════════════════════╝"
  echo -e "${NC}"
  
  echo -e "${LIGHT_YELLOW}${BOLD}┌──────┬──────────────────────┬──────────────────────┐${NC}"
  echo -e "${LIGHT_YELLOW}${BOLD}│ No   │ Arabic               │ English              │${NC}"
  echo -e "${LIGHT_YELLOW}${BOLD}├──────┼──────────────────────┼──────────────────────┤${NC}"
  
  for i in "${!surah_ar[@]}"; do
    if (( (i+1) % 10 == 0 )); then
      printf "${LIGHT_GREEN}${BOLD}│ %03d  │ %-20s │ %-20s │${NC}\n" $((i+1)) "${surah_ar[$i]}" "${surah_en[$i]}"
    else
      printf "${WHITE}│ %03d  │ %-20s │ %-20s │${NC}\n" $((i+1)) "${surah_ar[$i]}" "${surah_en[$i]}"
    fi
  done
  
  echo -e "${LIGHT_YELLOW}${BOLD}└──────┴──────────────────────┴──────────────────────┘${NC}"
  echo -e "${DIM}💡 استخدم الرقم أو الاسم العربي أو الإنجليزي للتشغيل${NC}"
}

list_reciters() {
  echo -e "${LIGHT_CYAN}${BOLD}"
  echo "╔══════════════════════════════════════════════════════════════════════════════╗"
  echo "║                         🎙️  قائمة القراء - Reciters List 🎙️                  ║"
  echo "╚══════════════════════════════════════════════════════════════════════════════╝"
  echo -e "${NC}"
  
  echo -e "${LIGHT_YELLOW}${BOLD}┌────────┬──────────────────────┬───────────────────────────┐${NC}"
  echo -e "${LIGHT_YELLOW}${BOLD}│ ID     │ Arabic               │ English                   │${NC}"
  echo -e "${LIGHT_YELLOW}${BOLD}├────────┼──────────────────────┼───────────────────────────┤${NC}"
  
  for id in "${!reciters[@]}"; do
    IFS="|" read -r ar en <<< "${reciters[$id]}"
    printf "${LIGHT_GREEN}${BOLD}│ %-6s │ %-20s │ %-25s │${NC}\n" "$id" "$ar" "$en"
  done
  
  echo -e "${LIGHT_YELLOW}${BOLD}└────────┴──────────────────────┴───────────────────────────┘${NC}"
  echo -e "${DIM}💡 استخدم الـ ID أو اسم القارئ للاختيار${NC}"
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
    echo -e "${RED}${BOLD}❌ ERROR: سورة غير موجودة! ${NC}"
    echo -e "${YELLOW}💡 استخدم الأمر: ${LIGHT_GREEN}qurani list-surahs${NC}"
    exit 1
  fi
  
  if [[ -z $reciter_id ]]; then
    echo -e "${RED}${BOLD}❌ ERROR: قارئ غير موجود! ${NC}"
    echo -e "${YELLOW}💡 استخدم الأمر: ${LIGHT_GREEN}qurani list-reciters${NC}"
    exit 1
  fi
  
  url="https://server8.mp3quran.net/${reciter_id}/$(printf "%03d" $surah_num).mp3"
  
  # Beautiful playing message
  echo -e "${LIGHT_CYAN}${BOLD}"
  echo "╔══════════════════════════════════════════════════════════════════════════════╗"
  echo "║                                Now Playing                                   ║"
  echo "╚══════════════════════════════════════════════════════════════════════════════╝"
  echo -e "${NC}"
  
  IFS="|" read -r ar_name en_name <<< "${reciters[$reciter_id]}"
  
  echo -e "${LIGHT_GREEN}${BOLD}📖 Surah:${NC} ${WHITE}${surah_en[$((surah_num-1))]} (${surah_ar[$((surah_num-1))]})${NC}"
  echo -e "${LIGHT_BLUE}${BOLD}🎙️  Reciter:${NC} ${WHITE}${ar_name} - ${en_name}${NC}"
  echo -e "${LIGHT_YELLOW}${BOLD}🔗 URL:${NC} ${DIM}${url}${NC}"
  
  echo -e "\n${LIGHT_CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${YELLOW}${BLINK}▶️${NC} ${LIGHT_GREEN}Loading and playing...${NC}"
  echo -e "${LIGHT_CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
  
  if command -v mpv &>/dev/null; then
    mpv --no-video "$url"
  elif command -v vlc &>/dev/null; then
    cvlc --play-and-exit "$url"
  else
    echo -e "${RED}${BOLD}❌ ERROR: ${NC}${RED}يرجى تثبيت mpv أو vlc${NC}"
    echo -e "${YELLOW}💡 To install mpv: ${LIGHT_GREEN}sudo apt install mpv${NC}"
    echo -e "${YELLOW}💡 To install vlc: ${LIGHT_GREEN}sudo apt install vlc${NC}"
    exit 1
  fi
}

# --- تنفيذ الأوامر ---
if [[ $# -eq 0 ]]; then
  banner
  exit 0
fi

case "$1" in
  list-surahs)
    echo -e "${LIGHT_CYAN}🔍 Loading Surahs list...${NC}"
    sleep 0.5
    list_surahs
    ;;
  list-reciters)
    echo -e "${LIGHT_CYAN}🔍 Loading Reciters list...${NC}"
    sleep 0.5
    list_reciters
    ;;
  play)
    if [[ -z "$2" ]]; then 
      echo -e "${RED}${BOLD}❌ ERROR: ${NC}${RED}يرجى تحديد السورة!${NC}"
      echo -e "${YELLOW}💡 Example: ${LIGHT_GREEN}qurani play الفاتحة${NC}"
      banner
      exit 1
    fi
    echo -e "${LIGHT_CYAN}🎵 Preparing to play Quran...${NC}"
    sleep 0.3
    play_surah "$2" "${3:-afs}"
    ;;
  --help|-h|help)
    banner
    ;;
  --version|-v|version)
    echo -e "${LIGHT_CYAN}${BOLD}"
    echo "╔══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                                Qurani CLI  v1.0                              ║"
    echo "║                              🕌 First Edition 🕌                             ║"
    echo "║                              by Mahdi Debbah  <3                             ║"
    echo "╚══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    ;;
  *)
    echo -e "${RED}${BOLD}❌ ERROR: ${NC}${RED}أمر غير معروف!${NC}"
    echo -e "${YELLOW}💡 Use: ${LIGHT_GREEN}qurani --help${NC} ${YELLOW}for available commands${NC}"
    echo ""
    banner
    ;;
esac
