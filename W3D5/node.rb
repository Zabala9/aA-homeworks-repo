class Node
    attr_reader :value, :childen

    def initialize(value, childen = [])
        @value = value
        @childen = childen
    end

    def dfs(target = nil, &prc)
        prc ||= Proc.new {|node| node.value == target}
        return self if prc.call(self) # self es child from method down
    
        childen.each do |child| # b
            result = child.dfs(&prc)
            return result unless result.nil?
        end
    
        nil
    end

    # supongamos que estamos buscando 'h'
    # primer paso tomamos 'a' y en linea 11 chequeamos si 'a'(self) es igual a 'h', como no es igual entra a itinerar 'a'
    # a tiene [b, c] so en la primera itineracion child es 'b', y en linea 14 llamamos el metodo de nuevo, self para a ser 'b'
    # y se evalua si 'b'(self) es igual a 'h', como no es igual entra a itinerar 'b' porque mi self es 'b'
    # y 'b' tiene [d, e] so en la primera itineracion child es 'd' y en la linea 14 llamamos el metodo de nuevo, self para a ser 'd'
    # y se evalua si 'd'(self) es igual a 'h', y ahora para a itinerar mi self('d') y 'd' tiene [h, i], so la primera itineracion
    # child es 'h', pasamos a llamar el metodo y en la linea 11 me retorna mi self (en este caso 'h') porque 'h' es igual a 'h'


    def bfs(target = nil, &prc)
        prc ||= Proc.new {|node| node.value == target}

        nodes_queue = [self]
        until nodes_queue.empty?
            node = nodes_queue.shift
            return node if prc.call(node)
            nodes_queue.concat {node.childen}
        end

        nil
    end

    #supongamos que estamos buscando 'c', mi self va ser 'a' y estamos poniendo self dentro del array nodes_queue
    # y vamos a itinerar el array hasta que este vacio, en este caso solo tenemos 'a', en la linea 35 removemos mi primer
    # elemento en mi array ([a]), removemos 'a' y la guardamos en una variable y en la linea 36 chequeamos si 'a' es igual a 'c'
    # como no son iguales no retornamos mi node('a') y en la linea 37 estamos diciendo que concat los hijos de mi node('a')
    # y mi node tiene los hijos [b, c], agregamos esto al array ([b, c]) y como el array no esta vacio seguimos en el loop
    # eliminamos el primer elemento en la linea 35 y la guardamos en una variable('b') y en la linea 36 chequeamos
    # si mi node('b') es igual a 'c', como no es igual seguimos a la linea 37 y agregamos a mi array los hijos de mi node('b')
    # mi node tiene los hijos [d, e], ahora mi array es ([c, d, e]) y el array sigue sin estar vacio entonces seguimos en el loop
    # y eliminamos el primer elemento ('c') y en la linea 36 comparamos si es igual con lo que estamos buscando,
    # en este caso si son iguales y retornamos ese nodo('c') y al tener la palabra 'return' mi codigo se rompe y sale del loop
    # teniendo como resultado mi nodo
end


d = Node.new("d")
e = Node.new("e")
f = Node.new("f")
g = Node.new("g")
b = Node.new("b", [d, e])
c = Node.new("c", [f, g])
a = Node.new("a", [b, c])
p a


