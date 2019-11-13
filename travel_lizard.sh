#!/bin/sh

echo "How many weeks will you be gone? (round up)"
read weeks

echo ""
echo "How's the weather?"
echo "(1) Hot"
echo "(2) Warm to cool"
echo "(3) Cold"
read weather
echo ""

hot=false
warmcool=false
cold=false

case "$weather" in
  1)
    hot=true
    echo "Time for some irradiation!"
    ;;
  2)
    warmcool=true
    echo "How pleasant."
    ;;
  3)
    cold=true
    echo "You ice demon!"
    ;;
  *)
    echo "Only enter a number between 1 and 3"
    ;;
esac

echo "Will you need to bring a suit for a conference? (y/n)"
read suitChoice
echo ""

suit=false

if [ "$suitChoice" = "y" ]; then
  suit=true
  echo "Well, well. Fancy, aren't we?"
else
  echo "Phew."
fi


echo ""
echo "Your packing list:"
echo ""

if $suit; then
  echo "Accessories:"
  echo "  no more than 3 ties"
  echo "  no more than 3 pocket squares"
  echo "  1 container of collar stays"
  echo "  1 pair of cufflinks"
  echo "  1 watch (optional)"
  echo ""
fi

echo "General apparel:"

if $suit; then
  echo "  2 regular shirts"
  echo "  1 formal shirt"
  echo "  1 formal belt"
  echo "  1 pair of formal shoes"
  echo "  1 suit jacket"
  echo "  1 pair of suit pants"
else
  echo "  3 shirts"
  echo "  1 belt"
  echo "  1 pair of shoes OR sandals"
fi

echo "  3 pairs of underwear"
echo "  3 extra pair of underwear... Trust me"
echo "  4 pairs of socks (if needed)"
echo "  1 cardigan (for cold airports!)"
echo "  1 hat (optional)"
echo "  1 pair of sunglasses"
echo "  1 pack of hair-ties"

if $hot; then
  echo "  1 rain jacket"
  if ! $suit; then
    echo "  1 pair of pants"
  fi
  echo "  3 pairs of shorts"
elif $warmcool; then
  echo "  1 rain jacket"
  if ! $suit; then
    echo "  1 pair of pants"
  fi
  echo "  1 pair of shorts"
  echo "  1-2 additional pairs of pants OR shorts"
else
  echo "  1 coat"
  if $suit; then
    echo "  2 pairs of pants"
  else
    echo "  3 pairs of pants"
  fi
fi

echo ""
echo "Travel:"
echo "  1 eye mask"
echo "  1 passport"
echo "  1 debit card"
echo "  1 water bottle"
echo "  1 fanny pack"
echo "  1 drawstring backpack"
echo "  1 travel pillow (only if any leg or layover exceeds 3 hours)"
echo "    cash"
echo "    printed travel confirmations and passports"
echo ""

echo "Hygiene:                                          "

if ! $suit; then
  echo "  1 towel                                         "
fi
echo "  1 razor handle                                  "


echo "  $weeks extra razor(s)                           "

echo "  1 toothbrush                                    "
echo "  1 first-aid kit                                 "
echo "  1 floss spool                                   "
echo "  1 hair brush                                    "
echo "                                                  "
echo "Liquids:                                          "

laundry=$weeks/2
echo "  $laundry laundry detergent packet(s)            "

echo "  1 shaving soap                                  "
echo "  1 shampoo                                       "
echo "  1 body wash                                     "
echo "  1 deodorant                                     "
echo "  1 toothpaste                                    "
echo "  2 tubes of hydrocortisone                       "
echo "                                                  "
echo "Electronics:                                      "
echo "  1 wall socket to USB-C                          "
echo "  1 wall socket to micro-USB                      "
echo "  2 USB-C cables                                  "
echo "  1 micro-USB cable                               "
echo "  1 phone                                         "
echo "  1 Kindle                                        "
echo "  1 Kindle case                                   "
echo "  1 pair of earphones                             "
echo "  1 external battery                              "
echo "  1 laptop                                        "
echo "  1 laptop charger                                "
echo "  2 socket adapters (if traveling internationally)"

echo ""
echo "DO NOT BRING:"
echo "  More than three outfits"
echo "  More than one pair of shoes"
echo "  Formal clothing to non-conference travel"
echo "  Soylent"
