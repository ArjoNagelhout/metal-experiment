vertex RasterizerData terrain_vertex(
    uint vertexID [[vertex_id]],
    uint instanceID [[instance_id]],
    device VertexData const* vertices [[buffer(0)]],
    device CameraData const& camera [[buffer(1)]],
    device InstanceData const* instances [[buffer(2)]],
    device LightData const& light [[buffer(3)]])
{
    RasterizerData out;
    device VertexData const& data = vertices[vertexID];
    device InstanceData const& instance = instances[instanceID];

    out.fragmentPosition = instance.localToWorld * data.position;
    out.fragmentPositionLightSpace = light.lightSpace * float4(out.fragmentPosition.xyz, 1);
    out.position = camera.viewProjection * out.fragmentPosition;

    out.color = data.color;
    out.uv0 = data.position.xz;
    return out;
}
