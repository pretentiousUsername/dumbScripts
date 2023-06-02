using DataFrames
using CSV

dataframe = DataFrame(CSV.File("fy2023.csv"))
dataPoints = dataframe[!, :BudgetInMillions]
totalBudget = sum(dataPoints)
budgetInPercent = [100. * dataPoint / totalBudget for dataPoint in dataPoints]

dataframe[!, :BudgetInPercent] = budgetInPercent
println(dataframe)

using Plots
using PlotThemes

institutions = dataframe[!, :Agency]
theme(:dark)
pie(institutions, budgetInPercent, legend=:outerleft, title = "Share of the 2023 R&D budget by
    agency")
savefig("budgetShareFy2023.png")
