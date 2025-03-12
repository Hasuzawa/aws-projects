data "local_file" "book_files" {
  for_each = toset(["hamlet.json", "les-miserables.json", "faust.json"])
  filename = "./data/${each.value}"
}
