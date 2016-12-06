context("ratr.R")

test_that(
  "test rat",
  {
    expect_equal(rat_house()('a --> b')[1], "a_0 <- a()")
  }
)
