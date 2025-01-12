function resolveKnapsack(price::Vector{Integer}, weight::Vector{Integer}, capacity::Integer)
    nb_objects = length(price)
    # Initialize matrix (Cij)
    C = zeros(Int, nb_objects, capacity)
    # Recursion

    #First column
    for j in 1:capacity
        if weight[1] < j
            C[1, j] = 0
        else
            C[1, j] = price[1]
        end
    end

    # Fill other columns
    for i in 2:nb_objects
        for j in 1:capacity
            if j - weight[i] < 0
                C[i, j] = C[i-1, j]
            else
                C[i, j] = max(C[i-1, j], C[i-1, j-weight[i]] + price[i])
            end
        end
    end

    return C
end