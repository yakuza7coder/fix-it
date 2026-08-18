
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
