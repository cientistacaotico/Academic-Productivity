
# Variaveis ---------------------------------------------------------------

# tempo de atuacao
# numero de artigos publicados
# numero de orientacoes
# colaborações****
# linhas de pesquisa
# linha de pesquisa de formação
# numero de projetos de extensao
# visibilidade (exemplo: apresentacao de trabalho)

### Universidade

# colaboracao interna ou externa
# tempo de vida do curso
# localizacao geográfica com as publicacoes


# obtendo dados -----------------------------------------------------------

dir <- list.dirs("./Data")
folders <- list.files("./Data")
cv <- list()

for (i in 2:length(dir)) {
  files <- list.files(dir[i])
  for (j in 1:length(files)) {
    end <- paste(dir[i],files[j], sep = "/")
    cv[[j]] <- gld_read_zip(end)
  }
}

# cv[[1]][["tpesq"]][["bsc.start.year"]]
# cv[[1]][["tpesq"]][["bsc.end.year"]]
# cv[[1]][["tpesq"]][["msc.start.year"]]
# cv[[1]][["tpesq"]][["msc.end.year"]]
# cv[[1]][["tpesq"]][["phd.start.year"]]
# cv[[1]][["tpesq"]][["phd.end.year"]]



# for (i in 2:length(files)) {
#   files <- list.files(folders[2])
#   # for (j in 1:length(fileszip)) {
#   #   lista[[j]] <- gld_get_lattes_data_from_zip(fileszip[j])
#   # }
#   print(files)
# }

