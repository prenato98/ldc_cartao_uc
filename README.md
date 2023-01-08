# Visual/Personal Identity Reimagined
Repositório para os ficheiros do trabalho de rebrand ao cartão da UC.


<br />
1. APRESENTAÇÃO DO PROJETO <br />
A minha proposta prende-se no desenho e geração de cartões de identificação única para os membros constituintes da Universidade de Coimbra. Nestes será
possivel identificar graficamente a faculdade, o grau de ensino e o curso em que o indivíduo está inserido.
<br /><br />


2. APRESENTAÇÃO DO CONTEÚDO <br />
Na pasta "Grelha" estão todos os ficheiros de Processing, bem como os SVG usados e resultados finais de cartões (em ficheiros PDF). Na pasta "Estudos" também contém imagens dos estudos de esquemas feitos, bem como do estudo de cores. 
<br />
O ficheiro master de Processing é o Grelha.pde, que contém 6 objetos: <br />
- Cell: objeto que cria as células onde estão colocados os padrões; <br />
- InfoCard: objeto que insere dados visíveis e percetíveis no cartão; <br />
- OneCell: objeto que define o padrão de aleatoriedade; <br />
- OneCellAl: objeto que constrói o ícone de ano de entrada; <br />
- Padroes: objeto responsável pelos padrões das células 2x1; <br />
- ThreeCell: objeto responsável pela célula de 3x1; <br />
<br />
Os outros ficheiros que estão na mesma pasta do ficheiro de Processing são testes executados ao longo do processo e recursos usados no programa.
<br /><br />



3. PREENCHIMENTO DE DADOS <br />
Para preencher os dados do cartão, é preciso preencher os dados correspondentes a Faculdade (fac), Grau de Curso (grau), Curso (curso), a função na universiade, se é estudante, docente ou não-docente (estatuto), os anos de início e conclusão (anoLetivo), Número de Estudante (nAluno), nome de estudante (nome) e número de CC (nCC) - a partir da linha 100 do código de Processing. Os nomes das faculdades estão em comentário para se poder copiar a colar. 
Para um funcionamento mínimo do cartão, apenas é necessário preencher os campos de Faculdade (linha 101), Grau de Curso (linha 102) e número de estudante (linha 106). 

<br /><br />


4. GERAÇÃO & EXPORTAÇÃO DO CARTÃO <br />
    1 - Escrever o nome de destino do ficheiro gerado na linha 60, no espaço entre aspas e antes de ".pdf" - size(243, 153, PDF, "nomeFicheiro.pdf");.
    O nome aconselhado é composto de número de processo e depois a indicação da face que vai ser gerada (F para frente e T para trás) - "numeroProcessoF.pdf" para a parte da frente do cartão e "numeroProcessoT.pdf" para a traseira do cartão; <br />
    2 - Preencher os dados de acordo com as instruções do ponto 3 (PREENCHIMENTO DE DADOS); <br />
    3 - Na linha 500, deixar em comentário a função que não é para correr. Se for para gerar a frente do cartão, comentar a linha 502 - //cartaoTras(); - se for para gerar a traseira do cartão, comentar a linha 501 - //cartaoFrente(); <br />
    4 - Carregar em executar. O cartão aparecerá na pasta do ficheiro do Processing com o nome indicado no ficheiro. <br />
 <br />
Se houver um ficheiro PDF aberto com o mesmo nome que está presente no programa de Processing, o cartão não será gerado e dará erro no programa.
