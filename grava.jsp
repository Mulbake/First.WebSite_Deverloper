<%@page language="java" import="java.sql.*" %>

<%
    // cria as variaveis e armazena as informações digitadas pelo usuario
    String vnome  = request.getParameter("nome");
    String vemail = request.getParameter("email");
    int    vtelefone = Integer.parseInt( request.getParameter("telefone") );
    String vgenero = request.getParameter("genero");
    String vdata_nascimento = request.getParameter("data_nascimento");
    String vcidade  = request.getParameter("cidade");
    String vestado  = request.getParameter("estado");
    String vendereco  = request.getParameter("endereco");

    // variaveis para o banco de dados
    String banco    = "projeto";
    String endereco = "jdbc:mysql://localhost:3306/" + banco ;
    String usuario  = "root" ;
    String senha    = "" ;

    String driver   = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memoria
    Class.forName( driver );

    //cria a variavel para conectar com o banco
    Connection conexao ;
    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    //Cria a variavel sql com o comando de Inserir
    String sql = "INSERT INTO alunos (nome,email,telefone,genero,data_nascimento,cidade,estado,endereco) values(?,?,?,?,?,?,?,?)" ;

    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString(1, vnome);
    stm.setString(2, vemail);
    stm.setInt(3, vtelefone);
    stm.setString(4, vgenero);
    stm.setString(5, vdata_nascimento);
    stm.setString(6, vcidade);
    stm.setString(7, vestado);
    stm.setString(8, vendereco);

    stm.execute() ;
    stm.close() ;

    out.print("Dados gravados com sucesso!!!");
    out.print("<br><br>");
    out.print("<a href='cadastro.html'>Voltar</a>");
%>