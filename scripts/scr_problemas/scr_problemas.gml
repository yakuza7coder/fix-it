
/// aq vai fica tds os problemas do jg
/// Cada problema tem um "problem_id" q e tipo um código
/// COMO ADICIONAR UM PROBLEMA NOVO:
/// 1. Copie um bloco "case" inteiro aqui embaixo
/// 2. Troque o texto do case pelo ID novo
/// 3. Preencha nome, empresa e as 4 opções
/// só seguir o molde, n tem dificuldade
///  p usar na instancia na room e so clccr setup_problem("id_do_problema");

function get_problem_data(_id) {
    switch (_id) {


        case "lanchonete_fila":
            return {
                nome: "Fila no Caixa",
                empresa: "Lanchonete",
                opcoes: [
                    { texto: "Totem de Autoatendimento integrado ao estoque", coesao: 100 },
                    { texto: "Contratar mais funcionários para atendimento manual", coesao: 30 },
                    { texto: "Sistema de senha e chamada por número", coesao: 60 },
                    { texto: "Não fazer nada por enquanto", coesao: 0 }
                ]
            };

        // MODELO, copia e altera p fz varios problema novos
        case "modelo_exemplo":
            return {
                nome: "Nome do Problema",
                empresa: "Nome da Empresa",
                opcoes: [
                    { texto: "Opção 1 (melhor solução)", coesao: 100 },
                    { texto: "Opção 2", coesao: 60 },
                    { texto: "Opção 3", coesao: 40 },
                    { texto: "Opção 4 (pior solução)", coesao: 10 }
                ]
            };
    case "faltaSoro":
        return {
            nome: "Falta Crítica de Soro e Insumos Básicos",
            empresa: "Hospital",
            opcoes: [
                { texto: "Pedir soro emprestado a hospitais parceiros e racionar o uso nos leitos.", coesao: 100 },
                { texto: "Substituir medicações injetáveis por comprimidos sempre que possível.", coesao: 60 },
                { texto: "Pedir para os pacientes comprarem o próprio soro na farmácia da frente.", coesao: 40 },
                { texto: "Gastar o estoque até zerar tudo e depois suspender os atendimentos.", coesao: 10 }
            ]
        };
		case "Caixa":
            return {
                nome: "Caixa Infuncional",
                empresa: "Lanchonete",
                opcoes: [
                    { texto: "Verificar o cabo de dados do Pinpad e limpar o cache do spooler da impressora térmica", coesao: 100 },
                    { texto: "Desligar e ligar", coesao: 60 },
                    { texto: "Interditar o ambiente", coesao: 40 },
                    { texto: "Aceitar cruzeiros como forma de pagamento", coesao: 10 }
                ]
            };
   case "vazamento":
        return {
            nome: "Vazamento de óleo e mal funcionamento da esteira",
            empresa: "Gamer",
            opcoes: [
                { texto: "Pausar a linha de produção imediatamente, isolar o piso e aplicar pó absorvente.", coesao: 100 },
                { texto: "Colocar baldes embaixo do vazamento para não precisar parar o funcionamento da esteira.", coesao: 60 },
                { texto: "Limpar o óleo apenas com panos comuns enquanto o maquinário continua rodando.", coesao: 40 },
                { texto: "Deixar o fluido vazar pelo chão até o fim do expediente para não atrasar as metas.", coesao: 10 }
            ]
        };
	case "pane":
        return {
            nome: "Mal funcionamento do sistema geral",
            empresa: "Gamer",
            opcoes: [
                { texto: "Executar o diagnóstico de hardware pelo terminal reserva e isolar a máquina travada.", coesao: 100 },
                { texto: "Só reiniciar o monitor do terminal principal esperando que o sistema destrave.", coesao: 60 },
                { texto: "Remover a placa de circuito do painel com o sistema ligado para tentar limpar a poeira.", coesao: 40 },
                { texto: "Dar pancadas no gabinete do terminal até que os componentes voltem a responder.", coesao: 10 }
            ]
        };
	case "vazoGais":
        return {
            nome: "Vazamento de Gás na Linha dos Fogões",
            empresa: "Lanchonete",
            opcoes: [
                { texto: "Fechar o registro central imediatamente, evacuar a área e abrir todas as janelas.", coesao: 100 },
                { texto: "Desligar apenas o fogão que está vazando e continuar usando os outros queimadores.", coesao: 60 },
                { texto: "Tentar vedar o cano com fita isolante provisória sem interromper o serviço.", coesao: 40 },
                { texto: "Ignorar o cheiro e acelerar os pedidos para terminar o expediente mais rápido.", coesao: 10 }
            ]
        };

	    case "freezer":
        return {
            nome: "Pane no Refrigerador e Risco de Perda de Alimentos",
            empresa: "Lanchonete",
            opcoes: [
                { texto: "Transferir insumos críticos para freezers parceiros e descartar o que estragou.", coesao: 100 },
                { texto: "Cozinhar imediatamente os ingredientes que começaram a descongelar para não perder.", coesao: 60 },
                { texto: "Manter os alimentos no refrigerador quebrado e torcer para o técnico chegar logo.", coesao: 40 },
                { texto: "Servir os produtos mesmo com alteração de odor, mascarando o sabor com tempero.", coesao: 10 }
            ]
        };
    }

    show_debug_message("AVISO: problem_id '" + string(_id) + "' não existe em scr_problemas");
    return {
        nome: "Problema não configurado",
        empresa: "?",
        opcoes: [
            { texto: "(sem dados)", coesao: 0 },
            { texto: "(sem dados)", coesao: 0 },
            { texto: "(sem dados)", coesao: 0 },
            { texto: "(sem dados)", coesao: 0 }
        ]
    };
}


/// setup_problem(_id)
/// Chame isso no Creation Code de cada instância de obj_problema,
/// na Room. Define o ID certo e já carrega os dados junto.
///
/// Exemplo de uso (dentro da Creation Code da instância):
///     setup_problem("lanchonete_fila");
function setup_problem(_id) {
    problem_id = _id;
    problem_data = get_problem_data(_id);
}


// n meche aq, é sobre o resolvimento de probrema
function resolve_problem(_problema, _opcao_index) {
    var _opcoes = _problema.problem_data.opcoes;

    if (_opcao_index < 0 || _opcao_index >= array_length(_opcoes)) {
        show_debug_message("ERRO: opcao_index inválido em resolve_problem");
        return;
    }

    var _opcao = _opcoes[_opcao_index];
    var _coesao = _opcao.coesao;

    global.coesao_total += _coesao;
    global.coesao_count += 1;
    global.moedas += (_coesao div 10); // so isso q vai mecher, dps vai decidir a quantidade de moedas/ inflação do joguin

    _problema.is_solved = true;

    if (instance_exists(obj_men)) {
        obj_men.text = "Coesão: " + string(_coesao) + "% | Moedas: " + string(global.moedas);
        obj_men.tempo = 120;
    }
}