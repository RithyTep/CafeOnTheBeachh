

FOLDER="/Users/rithytep/SideProject/MercyCafe/CafeOnTheBeach/dbo/Store Procedures"
SERVER="localhost"
DATABASE="Main"
USERNAME="sa"
PASSWORD="112233Akak500@@("

for FILE in "$FOLDER"/*.sql; do
  BASENAME=$(basename "$FILE")
  echo "▶️ Running: $BASENAME"

  OUTPUT=$(sqlcmd -S "$SERVER" -d "$DATABASE" -U "$USERNAME" -P "$PASSWORD" -i "$FILE" -N -C 2>&1)
  STATUS=$?

  if [ $STATUS -ne 0 ] || echo "$OUTPUT" | grep -q "Msg "; then
    echo "❌ Failed: $BASENAME"
    echo "$OUTPUT" | grep -E "Msg |Error"
  else
    echo "✅ Success: $BASENAME"
  fi

  echo ""
done
