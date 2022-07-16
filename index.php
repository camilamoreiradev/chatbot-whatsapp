<?php
 
require "./library/lib.php";

$data = json_decode(file_get_contents('php://input'), true);

if($data['messageType'] == 'conversation' && $data['key']['fromMe'] === false) {
    $name = $data['pushName'];
	$phone = $data['key']['remoteJid'];
	$text = $data['message']['conversation'];

    if(statusConversation($phone)) {
        if(strtoupper($text) == "PEDIDO") {
            $fields = ["phone"=>$phone, "content"=>"O cliente decidiu iniciar o pedido.", "code"=>"001"];
			addConversation($fields);
            if(checkCustomer($phone)) {
                $fields = ["phone"=>$phone, "content"=>"Enviamos as opções iniciais para o cliente.", "code"=>"003"];
			    addConversation($fields);
                
                $params = ["to"=>$phone, "text"=>$name.", agora vamos começar a anotar o seu pedido.\nEscolha uma das opções para começar:\n*1* - Fazer pedido"];
		        sendMessage($params);
			} else {
                $fields = ["phone"=>$phone, "content"=>"Solicitamos o nome do cliente.", "code"=>"002"];
			    addConversation($fields);
                
                $params = ["to"=>$phone, "text"=>"Notamos que você não esta cadastrado em nosso sistema, por favor, nos informe o seu nome:"];
		        sendMessage($params);
			}
        } else {
            $lastCode = lastCode($phone);
            switch($lastCode) {
                case 2:
                    $fields = ["phone"=>$phone, "content"=>"Capturamos o nome do cliente.", "code"=>"004"];
			        addConversation($fields);

                    $fields = ["name"=>$text, "phone"=>$phone];
					addCustomer($fields);

                    $fields = ["phone"=>$phone, "content"=>"Enviamos as opções iniciais para o cliente.", "code"=>"003"];
			        addConversation($fields);
							
                    $params = ["to"=>$phone, "text"=>$text.", agora vamos começar a anotar o seu pedido.\nEscolha uma das opções para começar:\n*1* - Fazer pedido"];
		            sendMessage($params);
					break;
                case 3:
                    if($text == 1) {
                        $fields = ["phone"=>$phone, "content"=>"Enviamos os produtos para o cliente.", "code"=>"005"];
			            addConversation($fields);
                        
                        $products = listProduts();

                        $params = ["to"=>$phone, "text"=>"Informe o código do produto desejado:\n\n".$products];
		                sendMessage($params);
                    } else {
                        $params = ["to"=>$phone, "text"=>"Você enviou uma opção inválida, tente novamente."];
		                sendMessage($params);
                    }
                    break;
                case 5:
                    if(checkProduct($text)) {
                        $fields = ["customer"=>$phone, "product"=>$text];
                        $request = addRequest($params);

                        $fields = ["phone"=>$phone, "content"=>"O cliente escolheu produto.", "code"=>"006"];
			            addConversation($fields);
                        
                        $params = ["to"=>$phone, "text"=>"Pedido criado com sucesso, pedido número: ".$request];
		                sendMessage($params);
                    } else {
                        $params = ["to"=>$phone, "text"=>"Você enviou uma opção inválida, tente novamente."];
		                sendMessage($params);
                    }
                    break;
            }
        }
    } else {
        $fields = ["phone"=>$phone, "content"=>"Mensagem de boas vindas.", "code"=>"000"];
		addConversation($fields);
		
        $params = ["to"=>$phone, "text"=>"Olá, seja bem vindo ao nossa atendimento virtual. Para iniciar o seu pedido, digite a palavra *PEDIDO*."];
		sendMessage($params);
    }
}