//
// Created by Arjo Nagelhout on 09/07/2024.
//

#include "gtest/gtest.h"

#include "import/gltf.h"

#include "test_args.h"

namespace gltf_test
{
    TEST(Gltf, Import)
    {
        if (assetsPath.empty())
        {
            return;
        }
        std::cout << assetsPath << std::endl;

        id <MTLDevice> device = MTLCreateSystemDefaultDevice();

        model::Model model;
        bool success = importGltf(device, assetsPath / "gltf" / "cathedral.glb", &model);
        ASSERT_TRUE(success);
    }
}