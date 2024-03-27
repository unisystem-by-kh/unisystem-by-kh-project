package kh.finalpro.project.collegian.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.collegian.model.dto.Certificate;

@Repository
public class CertificateDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 학생증 조회
	public int selectCertificateCount(Certificate certificate) {
		return sqlSession.selectOne("certificateMapper.selectCertificateCount",certificate);
	}
	
	// 증명서 생성
	public int insertCertificate(Certificate certificate) {
		return sqlSession.insert("certificateMapper.insertCertificate",certificate);
	}

	// 증명서 조회
	public Certificate selectCertificate(Certificate certificate) {
		return sqlSession.selectOne("certificateMapper.selectCertificate",certificate);
	}

	public int updateCertificate(Certificate certificate) {
		return sqlSession.update("certificateMapper.updateCertificate",certificate);
	}

	

}
