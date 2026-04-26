#!/usr/bin/env bash
set -euo pipefail

HTML="index.html"
CSS="css/estilos.css"

error() {
  echo "ERROR: $1" >&2
  exit 1
}

check_files_exist() {
  [[ -f "$HTML" ]] || error "No se encuentra $HTML"
  [[ -f "$CSS" ]] || error "No se encuentra $CSS"
}

check_base_structure() {
  check_files_exist

  grep -Eq '<meta[^>]*name=["'"'"']viewport["'"'"'][^>]*>' "$HTML" \
    || error "Falta la etiqueta viewport en index.html"
  grep -Eq '<header>' "$HTML" || error "Falta el header en index.html"
  grep -Eq '<main>' "$HTML" || error "Falta el main en index.html"
  grep -Eq '<footer>' "$HTML" || error "Falta el footer en index.html"

  echo "CORRECTO"
}

check_media_queries_declared() {
  check_files_exist

  grep -Eq '@media[[:space:]]*\([[:space:]]*max-width:[[:space:]]*768px[[:space:]]*\)' "$CSS" \
    || error "No se encontro media query para max-width: 768px"
  grep -Eq '@media[[:space:]]*\([[:space:]]*max-width:[[:space:]]*450px[[:space:]]*\)' "$CSS" \
    || error "No se encontro media query para max-width: 450px"

  echo "CORRECTO"
}

check_tablet_adjustments() {
  check_files_exist

  # Se valida que exista la media query y que haya al menos un ajuste estructural esperado.
  grep -Eq '@media[[:space:]]*\([[:space:]]*max-width:[[:space:]]*768px[[:space:]]*\)' "$CSS" \
    || error "No se encontro media query para tablet"

  grep -Eq 'flex-direction:[[:space:]]*column' "$CSS" \
    || error "No se encontro ningun cambio a layout vertical para tablet/movil"

  grep -Ezq '(#card-section[[:space:]]*>[[:space:]]*div|section[[:space:]]*>[[:space:]]*div|footer)[^{]*\{[^}]*flex-direction:[[:space:]]*column' "$CSS" \
    || error "No se encontro ajuste de distribucion para secciones o footer"

  echo "CORRECTO"
}

check_mobile_adjustments() {
  check_files_exist

  grep -Eq '@media[[:space:]]*\([[:space:]]*max-width:[[:space:]]*450px[[:space:]]*\)' "$CSS" \
    || error "No se encontro media query para movil"

  grep -Ezq '\.card[^{]*\{[^}]*width:[[:space:]]*(100%|auto)' "$CSS" \
    || error "No se encontro ajuste de ancho de .card para movil"
  grep -Ezq '(\.formulario|\.contacto)[^{]*\{[^}]*width:[[:space:]]*(100%|auto)' "$CSS" \
    || error "No se encontro ajuste de ancho para formulario/contacto en movil"

  echo "CORRECTO"
}

case "${1:-}" in
  base-structure)
    check_base_structure
    ;;
  media-queries)
    check_media_queries_declared
    ;;
  tablet-layout)
    check_tablet_adjustments
    ;;
  mobile-layout)
    check_mobile_adjustments
    ;;
  *)
    error "Uso: $0 {base-structure|media-queries|tablet-layout|mobile-layout}"
    ;;
esac
