data "local_file" "index_page" {
  filename = "./static/index.html"
}

data "local_file" "error_404_page" {
  filename = "./static/404.html"
}

data "local_file" "product1" {
  filename = "./static/product-1.json"
}

data "local_file" "product2" {
  filename = "./static/product-2.json"
}
