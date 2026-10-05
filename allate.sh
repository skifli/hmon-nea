OUTPUT_FILE="all_combined_tex.txt"

> "$OUTPUT_FILE"

SRC_DIR="src"

if [ -d "$SRC_DIR" ]; then
    echo "Finding and combining all .tex files in $SRC_DIR..."

    find "$SRC_DIR" -type f -name "*.tex" | sort | while read -r file; do
        echo "Processing: $file"

        echo "$file" >> "$OUTPUT_FILE"
        cat "$file" >> "$OUTPUT_FILE"
        echo -e "\n\n" >> "$OUTPUT_FILE"
    done
else
    echo "Error: '$SRC_DIR' directory not found." >&2
    exit 1
fi

echo "Done! All files written to $OUTPUT_FILE"
