#' Uploads a table to a folder in a project
#'
#' @param project the project to upload to
#' @param folder the folder to upload to
#' @param table the table to upload
#' @param name name of the table (optional)
#'
#' @return TRUE if successful, otherwise an object of class aws_error details
#'
#' @importFrom arrow write_parquet
#'
#' @examples
#' \dontrun{
#' armadillo.upload_table(
#'   project = "gecko",
#'   folder = "core_all",
#'   table1
#' )
#' }
#'
#' @export
armadillo.upload_table <- function(project, folder, table, name = NULL) { # nolint
  stopifnot(is.data.frame(table))

  if (is.null(name)) { # nolint
    name <- deparse(substitute(table))
  }

  .upload_object(project, folder, table, name, .compress_table)
}

#' Helper function for compressing to a parquet file
#'
#' @param table the table to write to file
#' @param file the name of the file (without extension)
#'
#' @return the extension of the file
#'
.compress_table <- function(table, file) {
  arrow::write_parquet(table, file)
  ".parquet"
}

#' List the tables in a project
#'
#' @param project the shared project in which the tables are located
#'
#' @return the table names, without the extension
#'
#' @examples
#' \dontrun{
#' armadillo.list_tables("gecko")
#' }
#'
#' @export
armadillo.list_tables <- function(project) { # nolint
  .list_objects_by_extension(project, ".parquet")
}

#' Delete table
#'
#' @param project project to delete the table from
#' @param folder folder to delete the table from
#' @param name table name
#'
#' @return TRUE if successful, otherwise an object of class aws_error details
#'
#' @examples
#' \dontrun{
#' armadillo.delete_table(
#'   project = "gecko",
#'   folder = "core_all",
#'   name = "table1"
#' )
#' }
#'
#' @export
armadillo.delete_table <- function(project, folder, name) { # nolint
  .delete_object(project, folder, name, ".parquet")
}

#' Copy table
#'
#' @param project study or other variable collection
#' @param folder the folder containing the table
#' @param name specific table for copy action
#' @param new_project new location of study or other variable collection
#' @param new_folder name of the folder in which to place the copy, defaults to
#' folder
#' @param new_name name of the copy, defaults to name
#'
#' @return the response from the server
#'
#' @examples
#' \dontrun{
#' armadillo.copy_table(
#'   project = "gecko",
#'   folder = "core_all",
#'   name = "table1",
#'   new_project = "gecko",
#'   new_folder = "core_all_v2",
#' )
#' }
#'
#' @export
armadillo.copy_table <- # nolint
  function(project, folder, name,
           new_project = project,
           new_folder = folder,
           new_name = name) {
    .copy_object(
      project,
      folder,
      name,
      new_project,
      new_folder,
      new_name,
      ".parquet"
    )
  }

#' Load a table from a project
#'
#' @param project study or collection variables
#' @param folder the folder containing the table
#' @param name name of the table
#'
#' @return the contents of the table file, as data frame
#'
#' @importFrom arrow read_parquet
#'
#' @examples
#' \dontrun{
#' armadillo.load_table(
#'   project = "gecko",
#'   folder = "core_all",
#'   name = "lc_core_1"
#' )
#' }
#'
#' @export
armadillo.load_table <- function(project, folder, name) { # nolint
  .load_object(project, folder, name, .load_table, ".parquet")
}

#' Helper function to extract a parquet file
#'
#' @param file file to extract
#'
#' @return the contents of the file, as data frame
#'
.load_table <- function(file) {
  arrow::read_parquet(file)
}

#' Move the table
#'
#' @param project a study or collection of variables
#' @param folder the folder containing the table to move
#' @param name a table to move
#' @param new_project the project to move the table to
#' @param new_folder the folder to move the table to, defaults to folder
#' @param new_name use to rename the file, defaults to name
#'
#' @return NULL, invisibly
#'
#' @examples
#' \dontrun{
#' armadillo.move_table(
#'   project = "gecko",
#'   folder = "core_all",
#'   name = "table1",
#'   new_project = "gecko",
#'   new_folder = "core_all_v2",
#' )
#' }
#'
#' @export
armadillo.move_table <- # nolint
  function(project, folder, name,
           new_project = project,
           new_folder = folder,
           new_name = name) {
    .move_object(
      project,
      folder,
      name,
      new_project,
      new_folder,
      new_name,
      ".parquet"
    )
  }