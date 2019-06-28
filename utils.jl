
function display_results(behaviors, Dϕ, Ddba)
    io = IOBuffer()
    print(io, """
    <h3>Fitted distributions</h3>
    <table>
    <thead>
    <tr><th>behavior</th><th>ϕ: Normal(μ, σ)</th><th>DBA: Weibull(α, θ)</th></tr>
    </thead>
    """)

    for i in 1:length(behaviors)
        print(io, "<tr>")
        print(io, "<th>$(behaviors[i])</th>")
        print(io ,"<td>μ = $(round(Dϕ[i].μ, digits=2)), σ = $(round(Dϕ[i].σ, digits=3))</td>")

        print(io, "<td>α = $(round(Ddba[i].α,digits=2)) , θ = $(round(Ddba[i].θ, digits=3))</td>")
        print(io, "</tr>")
    end
    print(io, "</table>")

    display("text/html", String(take!(io)))
end