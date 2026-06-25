package com.suviny.rss.global.common.mybatis.type;

/**
 * 데이터베이스 테이블의 컬럼과 매핑 대상이 되는 코드값을 가진 {@link Enum}의 공통 규약을 정의한 인터페이스
 */

public interface CodeEnum {
    /**
     * 디비 테이블의 컬럼과 매핑 대상이 되는 코드값을 반환한다.
     */
    String getCode();

    /**
     * 코드값에 대한 화면 UI 라벨을 반환한다.
     */
    String getLabel();
}