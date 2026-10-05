if [ -z "$1" ]; then
    exit 1
fi

CHAPTER_NUM="$1"
OUTPUT_FILE="chapter_${CHAPTER_NUM}_combined.txt"

> "$OUTPUT_FILE"

CHAPTER_DIR=$(find src/chapters -maxdepth 1 -type d -name "${CHAPTER_NUM}_*" | head -n 1)

if [ -d "$CHAPTER_DIR" ]; then
    for file in $(find "$CHAPTER_DIR" -type f -name "*.tex" | sort); do
        echo "$file" >> "$OUTPUT_FILE"
        cat "$file" >> "$OUTPUT_FILE"
        echo -e "\n\n" >> "$OUTPUT_FILE"
    done
fi

DIAGRAMS_DIR="src/assets/diagrams"
if [ -d "$DIAGRAMS_DIR" ]; then
    if ls "$DIAGRAMS_DIR"/${CHAPTER_NUM}_*.tex >/dev/null 2>&1; then
        for file in $(ls "$DIAGRAMS_DIR"/${CHAPTER_NUM}_*.tex | sort); do
            echo "$file" >> "$OUTPUT_FILE"
            cat "$file" >> "$OUTPUT_FILE"
            echo -e "\n\n" >> "$OUTPUT_FILE"
        done
    fi
fi

WIREFRAMES_DIR="src/assets/wireframes"
if [ -d "$WIREFRAMES_DIR" ]; then
    if ls "$WIREFRAMES_DIR"/${CHAPTER_NUM}_*.tex >/dev/null 2>&1; then
        for file in $(ls "$WIREFRAMES_DIR"/${CHAPTER_NUM}_*.tex | sort); do
            echo "$file" >> "$OUTPUT_FILE"
            cat "$file" >> "$OUTPUT_FILE"
            echo -e "\n\n" >> "$OUTPUT_FILE"
        done
    fi
fi
