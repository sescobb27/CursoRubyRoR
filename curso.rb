{
    by: { 
        name: 'Simón Escobar B',
        thanks: {
            promotores:
            ->{%W(
                Helmuth_Trefftz
                Alberto_Restrepo
                Edwin_Montoya
                GEMIS
            ).map! do |promotor|
                puts "#{promotor}"
                promotor.gsub! /_/, ' ' if promotor =~ /_+/
                promotor
            end
            }
        },
        year: ->{Time.now.year}
    }
}









def putblock &block
    if block_given?
        puts "inside block_given"
        block.call
    end
end





def get_year (year = nil, &block)
    if block_given?
        puts "inside block_given"
        block.call
    else
        puts "no block_given"
        puts "#{year}" if year
        year
    end
end

















{
    by: { 
        name: 'Simón Escobar B',
        thanks: {
            promotores:
            %W(
                Helmuth_Trefftz
                Alberto_Restrepo
                Edwin_Montoya
                GEMIS
            ).map! do |promotor|
                puts "#{promotor}"
                promotor.gsub! /_/, ' ' if promotor =~ /_+/
                promotor
            end
            
        },
        year: Time.now.year
    }
}



a = eval '->{ |args| args**2  }'.gsub '->','lambda'
a = eval 'lambda{ |args| args**2  }'