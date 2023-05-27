import 'package:uf_profielder_mobile/infrastructure/types/mapper/json_mapper.dart';

abstract class LocalMapper<Domain, Entity> {
  LocalMapper();

  Domain toDomain(Entity entity);

  Entity toEntity(Domain domain);
}
